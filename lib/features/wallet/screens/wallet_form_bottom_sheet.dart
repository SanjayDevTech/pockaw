import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pockaw/core/components/bottom_sheets/alert_bottom_sheet.dart';
import 'package:pockaw/core/components/bottom_sheets/custom_bottom_sheet.dart';
import 'package:pockaw/core/components/buttons/button_state.dart';
import 'package:pockaw/core/components/buttons/primary_button_m3.dart';
import 'package:pockaw/core/components/form_fields/custom_numeric_field.dart';
import 'package:pockaw/core/components/form_fields/custom_text_field.dart';
import 'package:pockaw/core/constants/app_colors.dart';
import 'package:pockaw/core/constants/app_spacing.dart';
import 'package:pockaw/core/constants/app_text_styles.dart';
import 'package:pockaw/core/database/database_provider.dart';
import 'package:pockaw/core/extensions/double_extension.dart';
import 'package:pockaw/core/extensions/string_extension.dart';
import 'package:pockaw/core/utils/logger.dart';
import 'package:pockaw/features/currency_picker/presentation/components/currency_picker_field.dart';
import 'package:pockaw/features/currency_picker/presentation/riverpod/currency_picker_provider.dart';
import 'package:pockaw/features/wallet/data/model/wallet_model.dart';
import 'package:pockaw/features/wallet/riverpod/wallet_providers.dart';
import 'package:toastification/toastification.dart';

class WalletFormBottomSheet extends HookConsumerWidget {
  final WalletModel? wallet;
  final bool showDeleteButton;
  final Function(WalletModel)? onSave;
  const WalletFormBottomSheet({
    super.key,
    this.wallet,
    this.showDeleteButton = true,
    this.onSave,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the default currency or use the wallet's currency if editing
    final isEditing = wallet != null;
    
    // Initialize with current selection but we'll update if editing
    final currency = ref.watch(currencyProvider);
    
    final nameController = useTextEditingController();
    final balanceController = useTextEditingController();
    final currencyController = useTextEditingController();
    // Add controllers for iconName and colorHex if you plan to edit them
    // final iconController = useTextEditingController(text: wallet?.iconName ?? '');
    // final colorController = useTextEditingController(text: wallet?.colorHex ?? '');

    // Initialize form fields if in edit mode (already handled by controller initial text)
    useEffect(() {
      if (isEditing && wallet != null) {
        // Set the wallet's currency in the provider state when editing
        final walletCurrency = wallet!.currencyByIsoCode(ref);
        // Update the currency provider to use the wallet's currency
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(currencyProvider.notifier).state = walletCurrency;
        });
        
        nameController.text = wallet!.name;
        balanceController.text = wallet!.balance == 0
            ? ''
            : '${walletCurrency.symbol} ${wallet?.balance.toPriceFormat()}';
        currencyController.text = wallet!.currency;
      }
      return null;
    }, [wallet, isEditing]);

    return CustomBottomSheet(
      title: '${isEditing ? 'Edit' : 'Add'} Wallet',
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.spacing16,
          children: [
            CustomTextField(
              controller: nameController,
              label: 'Wallet Name (max. 15)',
              hint: 'e.g., Savings Account',
              isRequired: true,
              prefixIcon: HugeIcons.strokeRoundedWallet02,
              textInputAction: TextInputAction.next,
              maxLength: 15,
              customCounterText: '',
            ),
            CurrencyPickerField(defaultCurrency: currency),
            CustomNumericField(
              controller: balanceController,
              label: 'Initial Balance',
              hint: '1,000.00',
              icon: HugeIcons.strokeRoundedMoney01,
              isRequired: true,
              appendCurrencySymbolToHint: true,
              useSelectedCurrency: true,
              // autofocus: !isEditing, // Optional: autofocus if adding new
            ),
            PrimaryButtonM3(
              label: 'Save Wallet',
              state: ButtonState.active,
              onPressed: () async {
                // Get the current selected currency from the provider
                final selectedCurrency = ref.read(currencyProvider);
                
                final newWallet = WalletModel(
                  id: wallet?.id, // Keep ID for updates, null for inserts
                  name: nameController.text.trim(),
                  balance: balanceController.text.takeNumericAsDouble(),
                  currency: selectedCurrency.isoCode, // Use the currently selected currency
                  iconName: wallet?.iconName, // Preserve or add UI to change
                  colorHex: wallet?.colorHex, // Preserve or add UI to change
                );

                // return;

                final db = ref.read(databaseProvider);
                try {
                  if (isEditing) {
                    Log.d(newWallet.toJson(), label: 'edit wallet');
                    // update the wallet
                    bool success = await db.walletDao.updateWallet(newWallet);
                    Log.d(success, label: 'edit wallet');

                    // only update active wallet if condition is met
                    ref
                        .read(activeWalletProvider.notifier)
                        .updateActiveWallet(newWallet);
                  } else {
                    Log.d(newWallet.toJson(), label: 'new wallet');
                    int id = await db.walletDao.addWallet(newWallet);
                    Log.d(id, label: 'new wallet');
                  }

                  onSave?.call(
                    newWallet,
                  ); // Call the onSave callback if provided
                  if (context.mounted) context.pop(); // Close bottom sheet
                } catch (e) {
                  // Handle error, e.g., show a SnackBar
                  toastification.show(
                    description: Text('Error saving wallet: $e'),
                  );
                }
              },
            ),
            if (isEditing && showDeleteButton)
              TextButton(
                child: Text(
                  'Delete',
                  style: AppTextStyles.body2.copyWith(color: AppColors.red),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    builder: (context) => AlertBottomSheet(
                      context: context,
                      title: 'Delete Wallet',
                      content: Text(
                        'All transactions, budgets, and goals will also be deleted. This action cannot be undone.',
                        style: AppTextStyles.body2,
                      ),
                      confirmText: 'Delete',
                      onConfirm: () {
                        // final db = ref.read(databaseProvider);
                        // db.walletDao.deleteWallet(wallet!.id!);
                        context.pop(); // close this dialog
                        context.pop(); // close form dialog
                        toastification.show(
                          autoCloseDuration: Duration(seconds: 3),
                          showProgressBar: true,
                          description: Text(
                            'Delete a wallet is coming soon...',
                            style: AppTextStyles.body2,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
