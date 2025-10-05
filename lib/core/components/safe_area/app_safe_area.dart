import 'package:flutter/material.dart';

/// A custom SafeArea widget that provides consistent safe area behavior
/// throughout the app.
/// 
/// This widget extends the standard Flutter SafeArea with some app-specific
/// defaults and additional functionality.
class AppSafeArea extends StatelessWidget {
  /// The child widget to be wrapped with safe area padding.
  final Widget child;
  
  /// Whether to avoid system intrusions on the left.
  final bool left;
  
  /// Whether to avoid system intrusions at the top of the screen.
  final bool top;
  
  /// Whether to avoid system intrusions on the right.
  final bool right;
  
  /// Whether to avoid system intrusions at the bottom of the screen.
  final bool bottom;
  
  /// Optional custom minimum padding to maintain regardless of system intrusions.
  final EdgeInsets? minimum;
  
  /// Whether the [SafeArea] should maintain the [MediaQueryData.viewPadding] instead
  /// of the [MediaQueryData.padding].
  final bool maintainBottomViewPadding;

  /// Creates an AppSafeArea widget.
  /// 
  /// By default, only respects top and bottom safe areas, which is the most
  /// common use case for this app's design. This differs from Flutter's default
  /// SafeArea which respects all edges.
  const AppSafeArea({
    super.key,
    required this.child,
    this.left = false, // Default to false for side edges
    this.top = true,  // Default to true for top
    this.right = false, // Default to false for side edges
    this.bottom = true, // Default to true for bottom
    this.minimum,
    this.maintainBottomViewPadding = false,
  });

  /// Creates an AppSafeArea that only applies safe area padding to the bottom.
  /// 
  /// Useful for widgets that appear at the bottom of the screen, like buttons
  /// and navigation bars.
  const AppSafeArea.bottom({
    super.key,
    required this.child,
    this.minimum,
    this.maintainBottomViewPadding = false,
  })  : left = false,
        top = false,
        right = false,
        bottom = true;

  /// Creates an AppSafeArea that only applies safe area padding to the top.
  /// 
  /// Useful for content that starts from the top of the screen but doesn't
  /// extend to the bottom.
  const AppSafeArea.top({
    super.key,
    required this.child,
    this.minimum,
    this.maintainBottomViewPadding = false,
  })  : left = false,
        top = true,
        right = false,
        bottom = false;

  /// Creates an AppSafeArea that applies padding to all sides.
  /// 
  /// Use this when content needs to be fully inset from all screen edges.
  const AppSafeArea.all({
    super.key,
    required this.child,
    this.minimum,
    this.maintainBottomViewPadding = false,
  })  : left = true,
        top = true,
        right = true,
        bottom = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum ?? EdgeInsets.zero,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: child,
    );
  }
}