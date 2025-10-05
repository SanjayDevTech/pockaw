import 'dart:io';
import 'package:flutter/foundation.dart';

/// Utility class for platform-specific checks and optimizations
class PlatformUtils {
  /// Check if the device is running Android 16 (API level 36) or higher
  /// 
  /// This can be used to apply specific theme optimizations for newer Android versions
  static bool get isAndroid16OrHigher {
    if (!kIsWeb && Platform.isAndroid) {
      try {
        // Platform.version returns something like "8.0.0"
        final versionStr = Platform.operatingSystemVersion;
        final versionMatch = RegExp(r'(\d+)').firstMatch(versionStr);
        if (versionMatch != null) {
          final majorVersion = int.tryParse(versionMatch.group(1) ?? '0') ?? 0;
          return majorVersion >= 16;
        }
      } catch (e) {
        debugPrint('Error detecting Android version: $e');
      }
    }
    return false;
  }

  /// Check if the device is a Pixel device
  /// 
  /// This is a best-effort detection that may not be 100% accurate
  static bool get isPixelDevice {
    if (!kIsWeb && Platform.isAndroid) {
      try {
        final deviceModel = Platform.localHostname.toLowerCase();
        return deviceModel.contains('pixel');
      } catch (e) {
        debugPrint('Error detecting Pixel device: $e');
      }
    }
    return false;
  }

  /// Get the approximate device generation for Pixel devices
  /// 
  /// Returns 0 for non-Pixel devices
  /// Returns 1-9 for Pixel 1-9
  /// Returns -1 if unable to determine
  static int getPixelGeneration() {
    if (!isPixelDevice) return 0;
    
    try {
      final deviceModel = Platform.localHostname.toLowerCase();
      // Try to extract pixel generation from model name
      for (int i = 9; i >= 1; i--) {
        if (deviceModel.contains('pixel $i') || 
            deviceModel.contains('pixel$i')) {
          return i;
        }
      }
    } catch (e) {
      debugPrint('Error detecting Pixel generation: $e');
    }
    return -1;
  }
}