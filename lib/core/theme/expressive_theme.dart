import 'package:flutter/material.dart';

/// Extension for Material 3 Expressive design
/// Enhanced for Android 16 QPR1 compatibility
class ExpressiveExtension extends ThemeExtension<ExpressiveExtension> {
  /// Whether to use the expressive design system
  final bool expressive;

  /// Surface tint color for elevated surfaces
  final Color? surfaceTintColor;

  /// Depth effect factor (0.0-1.0)
  final double? depthFactor;

  /// Motion design style (animation durations, curves)
  final MotionStyle? motionStyle;

  /// Shape density factor (0.0-1.0)
  final double? shapeDensity;

  /// Shadow strength factor (0.0-1.0)
  final double? shadowStrength;

  /// Type scale adjustments
  final double? typeScaleFactor;
  
  /// Animation duration multiplier (1.0 = standard)
  final double? animationSpeed;

  const ExpressiveExtension({
    this.expressive = true,
    this.surfaceTintColor,
    this.depthFactor = 0.85, // Higher depth effect for expressive on Android 16
    this.motionStyle = MotionStyle.emphasized,
    this.shapeDensity = 0.6, // Enhanced shape density for Android 16
    this.shadowStrength = 0.8, // Stronger shadows for expressive on modern displays
    this.typeScaleFactor = 1.05, // Slightly larger text for expressive
    this.animationSpeed = 1.0, // Standard animation speed
  });

  @override
  ExpressiveExtension copyWith({
    bool? expressive,
    Color? surfaceTintColor,
    double? depthFactor,
    MotionStyle? motionStyle,
    double? shapeDensity,
    double? shadowStrength,
    double? typeScaleFactor,
    double? animationSpeed,
  }) {
    return ExpressiveExtension(
      expressive: expressive ?? this.expressive,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      depthFactor: depthFactor ?? this.depthFactor,
      motionStyle: motionStyle ?? this.motionStyle,
      shapeDensity: shapeDensity ?? this.shapeDensity,
      shadowStrength: shadowStrength ?? this.shadowStrength,
      typeScaleFactor: typeScaleFactor ?? this.typeScaleFactor,
      animationSpeed: animationSpeed ?? this.animationSpeed,
    );
  }

  @override
  ThemeExtension<ExpressiveExtension> lerp(
    ThemeExtension<ExpressiveExtension>? other,
    double t,
  ) {
    if (other is! ExpressiveExtension) {
      return this;
    }

    return ExpressiveExtension(
      expressive: t < 0.5 ? expressive : other.expressive,
      surfaceTintColor: Color.lerp(surfaceTintColor, other.surfaceTintColor, t),
      depthFactor: lerpDouble(depthFactor, other.depthFactor, t),
      motionStyle: t < 0.5 ? motionStyle : other.motionStyle,
      shapeDensity: lerpDouble(shapeDensity, other.shapeDensity, t),
      shadowStrength: lerpDouble(shadowStrength, other.shadowStrength, t),
      typeScaleFactor: lerpDouble(typeScaleFactor, other.typeScaleFactor, t),
      animationSpeed: lerpDouble(animationSpeed, other.animationSpeed, t),
    );
  }
  
  // Helper method for lerping doubles that might be null
  double? lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return a + (b - a) * t;
  }
}

/// Motion style for animations in Material 3 Expressive
enum MotionStyle {
  /// Standard motion timing
  standard,
  
  /// Emphasized motion with more dramatic curves
  emphasized,
  
  /// Reduced motion for accessibility
  reduced,
}