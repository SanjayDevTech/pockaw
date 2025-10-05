import 'package:flutter/material.dart';
import 'package:pockaw/core/constants/app_font_families.dart';
import 'package:pockaw/core/constants/app_font_weights.dart';
import 'package:pockaw/core/constants/app_text_styles.dart';

/// Material 3 Expressive typography system
class M3Typography {
  /// Creates a Material 3 Expressive typography system
  /// 
  /// The Expressive variant features more distinct type styles with 
  /// increased contrast between different text roles.
  static TextTheme createExpressiveTextTheme({
    required bool isLight,
    double expressiveScaleFactor = 1.05,
  }) {
    final Color baseTextColor = isLight 
        ? const Color(0xFF1C1B1F) // Dark text on light background
        : const Color(0xFFE6E1E5); // Light text on dark background
    
    // Apply the expressive scale factor to make text slightly larger
    return TextTheme(
      // Display styles (largest text)
      displayLarge: AppTextStyles.headLine1.copyWith(
        color: baseTextColor,
        fontSize: 68 * expressiveScaleFactor,
        height: 1.12, // More dramatic line height for expressive
        letterSpacing: -0.25,
      ),
      displayMedium: AppTextStyles.headLine2.copyWith(
        color: baseTextColor,
        fontSize: 56 * expressiveScaleFactor,
        height: 1.12,
        letterSpacing: -0.25,
      ),
      displaySmall: AppTextStyles.heading1.copyWith(
        color: baseTextColor,
        fontSize: 46 * expressiveScaleFactor,
        height: 1.16,
        letterSpacing: -0.25,
      ),
      
      // Headline styles
      headlineLarge: AppTextStyles.heading2.copyWith(
        color: baseTextColor,
        fontSize: 38 * expressiveScaleFactor,
        height: 1.2,
      ),
      headlineMedium: AppTextStyles.heading3.copyWith(
        color: baseTextColor,
        fontSize: 32 * expressiveScaleFactor,
        height: 1.2,
      ),
      headlineSmall: AppTextStyles.heading4.copyWith(
        color: baseTextColor,
        fontSize: 26 * expressiveScaleFactor,
        height: 1.24,
      ),
      
      // Title styles
      titleLarge: AppTextStyles.heading5.copyWith(
        color: baseTextColor,
        fontSize: 22 * expressiveScaleFactor,
        height: 1.27,
        letterSpacing: 0,
        fontVariations: const [AppFontWeights.bold],
      ),
      titleMedium: AppTextStyles.heading6.copyWith(
        color: baseTextColor,
        fontSize: 18 * expressiveScaleFactor,
        height: 1.3,
        letterSpacing: 0.15,
        fontVariations: const [AppFontWeights.semiBold],
      ),
      titleSmall: AppTextStyles.body1.copyWith(
        color: baseTextColor,
        fontSize: 16 * expressiveScaleFactor,
        height: 1.3,
        letterSpacing: 0.1,
        fontVariations: const [AppFontWeights.semiBold],
      ),
      
      // Body styles
      bodyLarge: AppTextStyles.body1.copyWith(
        color: baseTextColor,
        fontSize: 16 * expressiveScaleFactor,
        height: 1.5,
        letterSpacing: 0.15,
      ),
      bodyMedium: AppTextStyles.body2.copyWith(
        color: baseTextColor,
        fontSize: 14 * expressiveScaleFactor,
        height: 1.43,
        letterSpacing: 0.25,
      ),
      bodySmall: AppTextStyles.body3.copyWith(
        color: baseTextColor.withOpacity(0.85),
        fontSize: 12 * expressiveScaleFactor,
        height: 1.33,
        letterSpacing: 0.4,
      ),
      
      // Label styles
      labelLarge: AppTextStyles.body2.copyWith(
        color: baseTextColor,
        fontSize: 14 * expressiveScaleFactor,
        height: 1.43,
        letterSpacing: 0.1,
        fontVariations: const [AppFontWeights.medium],
      ),
      labelMedium: AppTextStyles.body3.copyWith(
        color: baseTextColor,
        fontSize: 12 * expressiveScaleFactor,
        height: 1.33,
        letterSpacing: 0.5,
        fontVariations: const [AppFontWeights.medium],
      ),
      labelSmall: AppTextStyles.body4.copyWith(
        color: baseTextColor.withOpacity(0.85),
        fontSize: 11 * expressiveScaleFactor,
        height: 1.45,
        letterSpacing: 0.5,
        fontVariations: const [AppFontWeights.medium],
      ),
    );
  }

  /// Creates a numeric variant of the text theme for financial contexts
  static TextTheme createNumericTextTheme({
    required bool isLight,
  }) {
    final baseTheme = createExpressiveTextTheme(isLight: isLight);
    
    // For numeric text, we'll use a different font and adjust some properties
    return baseTheme.copyWith(
      // Use Urbanist font for numeric display
      displayLarge: baseTheme.displayLarge?.copyWith(
        fontFamily: AppFontFamilies.urbanist,
      ),
      displayMedium: baseTheme.displayMedium?.copyWith(
        fontFamily: AppFontFamilies.urbanist,
      ),
      displaySmall: baseTheme.displaySmall?.copyWith(
        fontFamily: AppFontFamilies.urbanist,
      ),
      
      // Use tabular figures for numeric data to ensure alignment
      bodyLarge: baseTheme.bodyLarge?.copyWith(
        fontFamily: AppFontFamilies.urbanist,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
      bodyMedium: baseTheme.bodyMedium?.copyWith(
        fontFamily: AppFontFamilies.urbanist,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
    );
  }
}