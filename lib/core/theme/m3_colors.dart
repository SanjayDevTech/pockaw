import 'package:flutter/material.dart';
import 'package:pockaw/core/constants/app_colors.dart';

/// Material 3 Color system tokens and utilities
class M3Colors {
  // Core color tokens based on app_colors.dart
  
  // Primary color tokens (from Robin's Egg Blue)
  static final ColorScheme primaryLight = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
  );
  
  static final ColorScheme primaryDark = ColorScheme.fromSeed(
    seedColor: AppColors.primary400,
    brightness: Brightness.dark,
  );
  
  // Standard Material 3 color mapping
  static ColorScheme lightColorScheme() {
    return ColorScheme(
      // Base colors
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: AppColors.primary100,
      onPrimaryContainer: AppColors.primary900,
      
      // Secondary colors
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.secondary100,
      onSecondaryContainer: AppColors.secondary900,
      
      // Tertiary colors
      tertiary: AppColors.tertiary,
      onTertiary: Colors.white,
      tertiaryContainer: AppColors.tertiary100,
      onTertiaryContainer: AppColors.tertiary900,
      
      // Error colors
      error: AppColors.red,
      onError: Colors.white,
      errorContainer: AppColors.red100,
      onErrorContainer: AppColors.red900,
      
      // Surface and background
      background: AppColors.light,
      onBackground: AppColors.neutral900,
      surface: AppColors.light,
      onSurface: AppColors.neutral900,
      
      // Surface variants
      surfaceVariant: AppColors.neutral100,
      onSurfaceVariant: AppColors.neutral700,
      outline: AppColors.neutral400,
      outlineVariant: AppColors.neutral300,
      
      // Shadow color
      shadow: Colors.black.withOpacity(0.2),
      scrim: Colors.black.withOpacity(0.4),
      
      // Inverse colors
      inverseSurface: AppColors.neutral800,
      onInverseSurface: AppColors.neutral50,
      inversePrimary: AppColors.primary300,
    );
  }
  
  static ColorScheme darkColorScheme() {
    return ColorScheme(
      // Base colors
      brightness: Brightness.dark,
      primary: AppColors.primary400,
      onPrimary: AppColors.primary950,
      primaryContainer: AppColors.primary900,
      onPrimaryContainer: AppColors.primary100,
      
      // Secondary colors
      secondary: AppColors.secondary400,
      onSecondary: AppColors.secondary950,
      secondaryContainer: AppColors.secondary800,
      onSecondaryContainer: AppColors.secondary100,
      
      // Tertiary colors
      tertiary: AppColors.tertiary400,
      onTertiary: AppColors.tertiary950,
      tertiaryContainer: AppColors.tertiary800,
      onTertiaryContainer: AppColors.tertiary100,
      
      // Error colors
      error: AppColors.red400,
      onError: AppColors.red950,
      errorContainer: AppColors.red800,
      onErrorContainer: AppColors.red100,
      
      // Surface and background 
      background: AppColors.dark,
      onBackground: AppColors.neutral100,
      surface: AppColors.dark,
      onSurface: AppColors.neutral100,
      
      // Surface variants
      surfaceVariant: AppColors.darkGrey,
      onSurfaceVariant: AppColors.neutral300,
      outline: AppColors.neutral600,
      outlineVariant: AppColors.neutral800,
      
      // Shadow color
      shadow: Colors.black,
      scrim: Colors.black,
      
      // Inverse colors
      inverseSurface: AppColors.neutral100,
      onInverseSurface: AppColors.neutral900,
      inversePrimary: AppColors.primary600,
    );
  }
  
  // Material 3 Expressive-specific color utilities
  static Color elevatedSurfaceColor(Color baseSurface, int elevation) {
    if (elevation <= 0) return baseSurface;
    
    // For dark themes with black surfaces, create subtle elevation hints
    if (baseSurface.value == 0xFF000000) {
      // Use increasingly lighter shades of dark gray for elevation
      final double opacity = 0.05 + (elevation * 0.01);
      return Color.fromRGBO(30, 30, 30, opacity);
    }
    
    return baseSurface;
  }
}