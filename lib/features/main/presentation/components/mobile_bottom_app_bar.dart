import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pockaw/core/components/buttons/circle_button.dart';
import 'package:pockaw/core/constants/app_colors.dart';
import 'package:pockaw/core/constants/app_radius.dart';
import 'package:pockaw/core/constants/app_spacing.dart';
import 'package:pockaw/core/router/routes.dart';
import 'package:pockaw/features/main/presentation/riverpod/main_page_view_riverpod.dart';

class MobileBottomAppBar extends ConsumerWidget {
  final PageController pageController;
  const MobileBottomAppBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using Material 3 Expressive style for navigation bar
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.spacing12,
        horizontal: AppSpacing.spacing16,
      ),
      decoration: BoxDecoration(
        color: context.navigationBar,
        borderRadius: BorderRadius.circular(AppRadius.radiusFull),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        // Add subtle shadow for elevated look in expressive design
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleIconButton(
            radius: 25,
            icon: HugeIcons.strokeRoundedHome01,
            backgroundColor: Colors.transparent,
            foregroundColor: ref
                .read(pageControllerProvider.notifier)
                .getIconColor(0),
            onTap: () {
              pageController.jumpToPage(0);
            },
          ),
          CircleIconButton(
            radius: 25,
            icon: HugeIcons.strokeRoundedReceiptDollar,
            backgroundColor: Colors.transparent,
            foregroundColor: ref
                .read(pageControllerProvider.notifier)
                .getIconColor(1),
            onTap: () {
              pageController.jumpToPage(1);
            },
          ),
          CircleIconButton(
            radius: 25,
            icon: HugeIcons.strokeRoundedPlusSign,
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.light,
            onTap: () {
              context.push(Routes.transactionForm);
            },
          ),
          CircleIconButton(
            radius: 25,
            icon: HugeIcons.strokeRoundedTarget01,
            backgroundColor: Colors.transparent,
            foregroundColor: ref
                .read(pageControllerProvider.notifier)
                .getIconColor(2),
            onTap: () {
              pageController.jumpToPage(2);
            },
          ),
          CircleIconButton(
            radius: 25,
            icon: HugeIcons.strokeRoundedMoneyBag02,
            backgroundColor: Colors.transparent,
            foregroundColor: ref
                .read(pageControllerProvider.notifier)
                .getIconColor(3),
            onTap: () {
              pageController.jumpToPage(3);
            },
          ),
        ],
      ),
    );
  }
}
