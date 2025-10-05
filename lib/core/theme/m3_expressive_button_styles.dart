import 'package:flutter/material.dart';

/// This helper class creates Material 3 Expressive button styles
/// for a consistent look throughout the app
class M3ExpressiveButtonStyles {
  
  /// Creates an elevated button style with Material 3 Expressive design
  static ButtonStyle elevatedButtonStyle(BuildContext context, {bool isDark = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // More rounded for expressive
      ),
      elevation: isDark ? 5 : 4, // Higher elevation for expressive design
      shadowColor: isDark ? Colors.black : colorScheme.shadow,
      surfaceTintColor: Colors.transparent, // Removes surface tint for cleaner look
      animationDuration: const Duration(milliseconds: 300), // Slower animations for expressive feel
    );
  }
  
  /// Creates a filled button style with Material 3 Expressive design
  static ButtonStyle filledButtonStyle(BuildContext context, {bool isDark = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Consistent with elevated buttons
      ),
      elevation: isDark ? 3 : 2, // More pronounced elevation for expressive design
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent, // Removes surface tint for cleaner look
      animationDuration: const Duration(milliseconds: 300), // Slower animations for expressive feel
      // Add subtle shadow for more depth
      shadowColor: isDark ? Colors.black : colorScheme.shadow.withOpacity(0.6),
    );
  }
  
  /// Creates an outlined button style with Material 3 Expressive design
  static ButtonStyle outlinedButtonStyle(BuildContext context, {bool isDark = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return OutlinedButton.styleFrom(
      padding: const EdgeInsets.all(20),
      backgroundColor: colorScheme.surface,
      side: BorderSide(
        color: isDark ? colorScheme.outline.withOpacity(0.8) : colorScheme.outline,
        width: 2.0, // Thicker border for more expressive design
      ),
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Consistent with other buttons
      ),
      foregroundColor: colorScheme.primary,
      elevation: isDark ? 1 : 0.5, // Slight elevation for depth even on outlined buttons
      shadowColor: colorScheme.shadow.withOpacity(isDark ? 0.3 : 0.2),
      animationDuration: const Duration(milliseconds: 300), // Slower animations for expressive feel
    );
  }
  
  /// Creates a text button style with Material 3 Expressive design
  static ButtonStyle textButtonStyle(BuildContext context, {bool isDark = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return TextButton.styleFrom(
      minimumSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // More rounded for consistency
      ),
      foregroundColor: colorScheme.primary,
      textStyle: TextStyle(
        fontWeight: FontWeight.w600, // Slightly bolder text for expressive design
        letterSpacing: 0.5, // Improved letter spacing for better readability
      ),
      animationDuration: const Duration(milliseconds: 300), // Slower animations for expressive feel
    );
  }
}