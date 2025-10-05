import 'package:flutter/material.dart';

/// Helper utilities for managing safe areas consistently throughout the app.
class SafeAreaUtils {
  /// Returns padding that accounts for safe areas.
  /// 
  /// This is useful for applying safe area insets to custom widgets without
  /// directly using SafeArea widget.
  /// 
  /// Usage:
  /// ```dart
  /// Container(
  ///   padding: EdgeInsets.only(
  ///     bottom: SafeAreaUtils.bottomPadding(context),
  ///   ),
  ///   child: YourWidget(),
  /// ),
  /// ```
  static double bottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double topPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double leftPadding(BuildContext context) {
    return MediaQuery.of(context).padding.left;
  }

  static double rightPadding(BuildContext context) {
    return MediaQuery.of(context).padding.right;
  }

  /// Extends the given EdgeInsets with safe area insets.
  /// 
  /// Usage:
  /// ```dart
  /// Container(
  ///   padding: SafeAreaUtils.extendPadding(
  ///     const EdgeInsets.all(16),
  ///     context,
  ///     bottom: true, // only extend bottom
  ///   ),
  ///   child: YourWidget(),
  /// ),
  /// ```
  static EdgeInsets extendPadding(
    EdgeInsets padding,
    BuildContext context, {
    bool top = false,
    bool bottom = false,
    bool left = false,
    bool right = false,
  }) {
    final mediaQuery = MediaQuery.of(context);
    
    return padding.copyWith(
      top: top ? padding.top + mediaQuery.padding.top : padding.top,
      bottom: bottom ? padding.bottom + mediaQuery.padding.bottom : padding.bottom,
      left: left ? padding.left + mediaQuery.padding.left : padding.left,
      right: right ? padding.right + mediaQuery.padding.right : padding.right,
    );
  }
}