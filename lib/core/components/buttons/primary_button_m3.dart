import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pockaw/core/components/buttons/button_state.dart';
import 'package:pockaw/core/components/buttons/button_type.dart';
import 'package:pockaw/core/components/loading_indicators/loading_indicator.dart';
import 'package:pockaw/core/constants/app_spacing.dart';

/// Primary button component using Material 3 Expressive styles
class PrimaryButtonM3 extends StatelessWidget {
  final String label;
  final bool isLoading;
  final bool isOutlined;
  final String loadingText;
  final IconData? icon;
  final EdgeInsets? padding;
  final ButtonType type;
  final ButtonState state;
  final VoidCallback? onPressed;

  /// Creates a Material 3 Expressive primary button
  const PrimaryButtonM3({
    required this.label,
    this.isLoading = false,
    this.isOutlined = false,
    this.loadingText = 'Please wait...',
    this.icon,
    this.padding,
    this.type = ButtonType.primary,
    this.state = ButtonState.active,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = isLoading || state == ButtonState.inactive ? null : onPressed;
    
    // Choose the right button style based on type and outlined state
    if (isOutlined) {
      return _buildOutlinedButton(context, effectiveOnPressed);
    } else {
      switch (type) {
        case ButtonType.primary:
        case ButtonType.secondary:
        case ButtonType.danger:
          return _buildElevatedButton(context, effectiveOnPressed);
        case ButtonType.tertiary:
          return _buildTextButton(context, effectiveOnPressed);
      }
    }
  }
  
  Widget _buildElevatedButton(BuildContext context, VoidCallback? onPressed) {
    return FilledButton(
      onPressed: onPressed,
      style: _getFilledButtonStyle(context),
      child: _buildButtonContent(context),
    );
  }
  
  Widget _buildOutlinedButton(BuildContext context, VoidCallback? onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: _getOutlinedButtonStyle(context),
      child: _buildButtonContent(context),
    );
  }
  
  Widget _buildTextButton(BuildContext context, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: _getTextButtonStyle(context),
      child: _buildButtonContent(context),
    );
  }
  
  ButtonStyle _getFilledButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTheme = theme.filledButtonTheme.style;
    
    switch (type) {
      case ButtonType.primary:
        return buttonTheme ?? FilledButton.styleFrom();
        
      case ButtonType.secondary:
        return FilledButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          foregroundColor: theme.colorScheme.onSecondary,
        );
        
      case ButtonType.tertiary:
        return FilledButton.styleFrom(
          backgroundColor: theme.colorScheme.tertiary,
          foregroundColor: theme.colorScheme.onTertiary,
        );
        
      case ButtonType.danger:
        return FilledButton.styleFrom(
          backgroundColor: theme.colorScheme.error,
          foregroundColor: theme.colorScheme.onError,
        );
    }
  }
  
  ButtonStyle _getOutlinedButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTheme = theme.outlinedButtonTheme.style;
    
    switch (type) {
      case ButtonType.primary:
        return buttonTheme ?? OutlinedButton.styleFrom();
        
      case ButtonType.secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.secondary,
          side: BorderSide(color: theme.colorScheme.secondary),
        );
        
      case ButtonType.tertiary:
        return OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.tertiary,
          side: BorderSide(color: theme.colorScheme.tertiary),
        );
        
      case ButtonType.danger:
        return OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.error,
          side: BorderSide(color: theme.colorScheme.error),
        );
    }
  }
  
  ButtonStyle _getTextButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTheme = theme.textButtonTheme.style;
    
    switch (type) {
      case ButtonType.primary:
      case ButtonType.tertiary:
        return buttonTheme ?? TextButton.styleFrom();
        
      case ButtonType.secondary:
        return TextButton.styleFrom(
          foregroundColor: theme.colorScheme.secondary,
        );
        
      case ButtonType.danger:
        return TextButton.styleFrom(
          foregroundColor: theme.colorScheme.error,
        );
    }
  }
  
  Widget _buildButtonContent(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelLarge;
    
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
            style: textStyle?.copyWith(
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
          Text(label, style: textStyle),
        ],
      );
    }
    
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSpacing.spacing16, vertical: AppSpacing.spacing8),
      child: Text(label, style: textStyle),
    );
  }
  
  Color _getLoadingColor(BuildContext context) {
    final theme = Theme.of(context);
    
    if (isOutlined) {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.primary;
        case ButtonType.secondary:
          return theme.colorScheme.secondary;
        case ButtonType.tertiary:
          return theme.colorScheme.tertiary;
        case ButtonType.danger:
          return theme.colorScheme.error;
      }
    } else {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.onPrimary;
        case ButtonType.secondary:
          return theme.colorScheme.onSecondary;
        case ButtonType.tertiary:
          return theme.colorScheme.onTertiary;
        case ButtonType.danger:
          return theme.colorScheme.onError;
      }
    }
  }
  
  Color _getTextColor(BuildContext context) {
    final theme = Theme.of(context);
    
    if (isOutlined) {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.primary;
        case ButtonType.secondary:
          return theme.colorScheme.secondary;
        case ButtonType.tertiary:
          return theme.colorScheme.tertiary;
        case ButtonType.danger:
          return theme.colorScheme.error;
      }
    } else {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.onPrimary;
        case ButtonType.secondary:
          return theme.colorScheme.onSecondary;
        case ButtonType.tertiary:
          return theme.colorScheme.onTertiary;
        case ButtonType.danger:
          return theme.colorScheme.onError;
      }
    }
  }
  
  // Helper methods for positioning the button in different layouts
  Widget get contained => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing20,
          vertical: AppSpacing.spacing20,
        ),
        child: this,
      );

  Widget get floatingBottom => Positioned(
        bottom: 0, 
        left: 0, 
        right: 0, 
        child: this,
      );

  Widget get floatingBottomContained => Positioned(
        bottom: 0, 
        left: 0, 
        right: 0, 
        child: contained,
      );

  Widget floatingBottomWithContent({required Widget content}) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Builder(
        builder: (context) {
          return Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.spacing20, 
              horizontal: AppSpacing.spacing20,
            ),
            child: Column(children: [content, this]),
          );
        },
      ),
    );
  }
}