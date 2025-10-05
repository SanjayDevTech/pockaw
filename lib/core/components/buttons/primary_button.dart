import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pockaw/core/components/buttons/button_state.dart';
import 'package:pockaw/core/components/buttons/button_type.dart';
import 'package:pockaw/core/components/loading_indicators/loading_indicator.dart';
import 'package:pockaw/core/constants/app_button_styles.dart';
import 'package:pockaw/core/constants/app_colors.dart';
import 'package:pockaw/core/constants/app_font_families.dart';
import 'package:pockaw/core/constants/app_spacing.dart';
import 'package:pockaw/core/constants/app_text_styles.dart';

/// Primary button component using Material 3 Expressive styles
class PrimaryButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final bool isOutlined;
  final String loadingText;
  final IconData? icon;
  final EdgeInsets? padding;
  final ButtonType type;
  final ButtonState state;
  final ThemeMode themeMode;
  final VoidCallback? onPressed;

  /// Creates a Material 3 Expressive primary button
  const PrimaryButton({
    required this.label,
    this.isLoading = false,
    this.isOutlined = false,
    this.loadingText = 'Please wait...',
    this.icon,
    this.padding,
    this.type = ButtonType.primary,
    this.state = ButtonState.active,
    this.themeMode = ThemeMode.system,
    this.onPressed,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = isLoading ? null : onPressed;
    
    // Choose the right button style based on type
    if (isOutlined) {
      return _buildOutlinedButton(context, effectiveOnPressed);
    } else {
      return _buildFilledButton(context, effectiveOnPressed);
    }
  }
  
  Widget _buildFilledButton(BuildContext context, VoidCallback? onPressed) {
    return FilledButton(
      onPressed: onPressed,
      style: _getButtonStyle(context),
      child: _buildButtonContent(context),
    );
  }
  
  Widget _buildOutlinedButton(BuildContext context, VoidCallback? onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: _getButtonStyle(context),
      child: _buildButtonContent(context),
    );
  }
  
  ButtonStyle _getButtonStyle(BuildContext context) {
    // Use the theme-provided button styles when possible
    switch (type) {
      case ButtonType.primary:
        return isOutlined 
            ? Theme.of(context).outlinedButtonTheme.style!
            : Theme.of(context).elevatedButtonTheme.style!;
      case ButtonType.secondary:
        return isOutlined
            ? Theme.of(context).outlinedButtonTheme.style!.copyWith(
                foregroundColor: MaterialStatePropertyAll(
                  context.colors.secondary,
                ),
              )
            : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStatePropertyAll(
                  context.colors.secondary,
                ),
              );
      case ButtonType.tertiary:
        return Theme.of(context).textButtonTheme.style!;
      case ButtonType.danger:
        return isOutlined
            ? Theme.of(context).outlinedButtonTheme.style!.copyWith(
                foregroundColor: MaterialStatePropertyAll(
                  context.colors.error,
                ),
                side: MaterialStatePropertyAll(
                  BorderSide(color: context.colors.error),
                ),
              )
            : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStatePropertyAll(
                  context.colors.error,
                ),
              );
      default:
        return isOutlined
            ? Theme.of(context).outlinedButtonTheme.style!
            : Theme.of(context).elevatedButtonTheme.style!;
    }
  }
  
  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingIndicator(
            size: 20,
            color: _getLoadingColor(context),
          ),
          const Gap(AppSpacing.spacing8),
          Text(
            loadingText,
            style: AppTextStyles.body3.copyWith(
              color: _getTextColor(context),
            ),
          ),
        ],
      );
    }
    
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const Gap(AppSpacing.spacing8),
          Text(label),
        ],
      );
    }
    
    return Text(label);
  }
  
  Color _getLoadingColor(BuildContext context) {
    if (isOutlined) {
      switch (type) {
        case ButtonType.primary:
          return context.colors.primary;
        case ButtonType.secondary:
          return context.colors.secondary;
        case ButtonType.tertiary:
          return context.colors.tertiary;
        case ButtonType.danger:
          return context.colors.error;
        default:
          return context.colors.primary;
      }
    } else {
      return Colors.white;
    }
  }
  
  Color _getTextColor(BuildContext context) {
    if (isOutlined) {
      switch (type) {
        case ButtonType.primary:
          return context.colors.primary;
        case ButtonType.secondary:
          return context.colors.secondary;
        case ButtonType.tertiary:
          return context.colors.tertiary;
        case ButtonType.danger:
          return context.colors.error;
        default:
          return context.colors.primary;
      }
    } else {
      return Colors.white;
    }
  }
    switch (type) {
      case ButtonType.primary:
        switch (state) {
          case ButtonState.active:
            if (isLoading) {
              return AppButtonStyles.primaryInactive(themeMode);
            }
            return AppButtonStyles.primaryActive(themeMode);
          case ButtonState.inactive:
            return AppButtonStyles.primaryInactive(themeMode);
          case ButtonState.outlinedActive:
            if (isLoading) {
              return AppButtonStyles.primaryOutlinedInactive(themeMode);
            }
            return AppButtonStyles.primaryOutlinedActive(themeMode);
          case ButtonState.outlinedInactive:
            return AppButtonStyles.primaryOutlinedInactive(themeMode);
        }
      case ButtonType.secondary:
        switch (state) {
          case ButtonState.active:
            if (isLoading) {
              return AppButtonStyles.secondaryInactive(themeMode);
            }
            return AppButtonStyles.secondaryActive(themeMode);
          case ButtonState.inactive:
            return AppButtonStyles.secondaryInactive(themeMode);
          case ButtonState.outlinedActive:
            if (isLoading) {
              return AppButtonStyles.secondaryOutlinedInactive(themeMode);
            }
            return AppButtonStyles.secondaryOutlinedActive(themeMode);
          case ButtonState.outlinedInactive:
            return AppButtonStyles.secondaryOutlinedInactive(themeMode);
        }
      case ButtonType.tertiary:
        switch (state) {
          case ButtonState.active:
            if (isLoading) {
              return AppButtonStyles.tertiaryInactive(themeMode);
            }
            return AppButtonStyles.tertiaryActive(themeMode);
          case ButtonState.inactive:
            return AppButtonStyles.tertiaryInactive(themeMode);
          case ButtonState.outlinedActive:
            if (isLoading) {
              return AppButtonStyles.tertiaryOutlinedActive(themeMode);
            }
            return AppButtonStyles.tertiaryOutlinedActive(themeMode);
          case ButtonState.outlinedInactive:
            return AppButtonStyles.tertiaryOutlinedInactive(themeMode);
        }
    }
  }
}

extension ButtonExtension on ButtonStyleButton {
  Widget get contained => Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Container(
        color: context.colors.surface,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: this,
      );
    },
  );

  Widget get floatingBottom =>
      Positioned(bottom: 0, left: 0, right: 0, child: this);

  Widget get floatingBottomContained =>
      Positioned(bottom: 0, left: 0, right: 0, child: contained);

  Widget floatingBottomWithContent({required Widget content}) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Consumer(
        builder: (context, ref, child) {
          return Container(
            color: context.colors.surface,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(children: [content, this]),
          );
        },
      ),
    );
  }
}
