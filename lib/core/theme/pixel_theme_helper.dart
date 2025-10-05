import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pockaw/core/theme/expressive_theme.dart';
import 'package:pockaw/core/utils/platform_utils.dart';

/// Helper class that provides Pixel-specific theme optimizations
class PixelThemeHelper {
  /// Apply Pixel-specific theme adjustments for Material 3 Expressive
  /// 
  /// This ensures that the app looks great on Pixel devices with Android 16 QPR1
  static ThemeData optimizeForPixel(ThemeData baseTheme) {
    // Only apply optimizations for Pixel devices
    if (!PlatformUtils.isPixelDevice) {
      return baseTheme;
    }
    
    // Get the Pixel generation (6-9 are more modern and need specific tweaks)
    final pixelGeneration = PlatformUtils.getPixelGeneration();
    final isModernPixel = pixelGeneration >= 6;
    
    // Get the current expressive extension or create a default one
    final currentExpressiveExtension = baseTheme.extension<ExpressiveExtension>() ?? 
        const ExpressiveExtension();
    
    // Create an optimized expressive extension for Pixel devices
    final optimizedExpressiveExtension = currentExpressiveExtension.copyWith(
      // Higher shadow strength for modern Pixel displays
      shadowStrength: isModernPixel ? 0.9 : 0.85,
      // Modern Pixels have better contrast, so we can use higher depth
      depthFactor: isModernPixel ? 0.95 : 0.9,
      // Modern Pixels have better animation capabilities
      animationSpeed: isModernPixel ? 1.0 : 0.9,
    );
    
    // Return the updated theme
    return baseTheme.copyWith(
      extensions: [
        optimizedExpressiveExtension,
      ],
    );
  }
  
  /// Apply Pixel-specific system UI settings
  static void applyPixelSystemUIOverlayStyle() {
    if (!PlatformUtils.isPixelDevice) return;
    
    // Modern Pixels use gesture navigation and need transparent system bars
    final isModernPixel = PlatformUtils.getPixelGeneration() >= 6;
    
    // Apply system UI overlay style optimizations
    SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
    );
    
    // Set the overlay style
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    
    // Set system UI mode for edge-to-edge on modern Pixels
    if (isModernPixel) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );
    }
  }
}