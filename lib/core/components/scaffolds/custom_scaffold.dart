import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pockaw/core/components/buttons/custom_icon_button.dart';
import 'package:pockaw/core/constants/app_colors.dart';
import 'package:pockaw/core/constants/app_radius.dart';
import 'package:pockaw/core/constants/app_spacing.dart';
import 'package:pockaw/core/constants/app_text_styles.dart';
import 'package:pockaw/core/extensions/double_extension.dart';
import 'package:pockaw/core/extensions/text_style_extensions.dart';
import 'package:pockaw/features/wallet/data/model/wallet_model.dart';
import 'package:pockaw/features/wallet/riverpod/wallet_providers.dart';

part 'balance_status_bar.dart';
part 'balance_status_bar_content.dart';

class CustomScaffold extends Scaffold {
  CustomScaffold({
    super.key,
    required BuildContext context,
    required Widget body,
    String title = '',
    bool showBackButton = true,
    bool showBalance = true,
    List<Widget>? actions,
    super.floatingActionButton,
  }) : super(
         resizeToAvoidBottomInset: true,
         backgroundColor: Theme.of(context).colorScheme.surface,
         // Wrap body with SafeArea to respect system insets
         body: SafeArea(
           bottom: false, // Don't apply bottom padding since we handle it separately
           child: body,
         ),
         appBar: AppBar(
           backgroundColor: Theme.of(context).colorScheme.surface,
           titleSpacing: showBackButton ? 0 : AppSpacing.spacing20,
           toolbarHeight: 64, // Match M3 Expressive height
           leadingWidth: 65,
           elevation: 0,
           automaticallyImplyLeading: false,
           scrolledUnderElevation: 2.0, // Add subtle elevation for M3 Expressive when scrolled
           shadowColor: Theme.of(context).colorScheme.shadow,
           leading: !showBackButton
               ? null
               : Padding(
                   padding: const EdgeInsets.only(left: 5),
                   child: CustomIconButton(
                     context,
                     onPressed: () => context.pop(),
                     icon: HugeIcons.strokeRoundedArrowLeft01,
                     themeMode: context.themeMode,
                   ),
                 ),
           title: title.isEmpty
               ? null
               : Text(title, style: AppTextStyles.heading6),
           actions: [...?actions, const Gap(AppSpacing.spacing20)],
           bottom: !showBalance ? null : BalanceStatusBar(),
         ),
       );
}
