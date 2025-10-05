import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pockaw/core/constants/app_colors.dart';
import 'package:pockaw/core/constants/app_constants.dart';
import 'package:pockaw/core/constants/app_spacing.dart';
import 'package:pockaw/core/constants/app_text_styles.dart';
import 'package:pockaw/core/theme/expressive_theme.dart';
import 'package:pockaw/core/theme/m3_colors.dart';
import 'package:pockaw/core/theme/m3_expressive_button_styles.dart';
import 'package:pockaw/core/theme/m3_typography.dart';
import 'package:pockaw/core/theme/pixel_theme_helper.dart';
import 'package:pockaw/core/router/app_router.dart';
import 'package:pockaw/core/utils/platform_utils.dart';
import 'package:pockaw/features/theme_switcher/presentation/riverpod/theme_mode_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    
    // Apply Pixel-specific optimizations for Android 16 QPR1
    // This will make Material 3 Expressive look great on Pixel devices
    if (PlatformUtils.isPixelDevice && PlatformUtils.isAndroid16OrHigher) {
      // Apply Pixel-specific system UI settings
      PixelThemeHelper.applyPixelSystemUIOverlayStyle();
    } else if (PlatformUtils.isAndroid16OrHigher) {
      // For non-Pixel Android 16 devices
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        systemNavigationBarColor: Colors.transparent, // Transparent navigation bar
        systemNavigationBarContrastEnforced: false, // More expressive look for Android 16
        statusBarIconBrightness: Brightness.dark, // Auto-adapted by Material 3
        systemNavigationBarIconBrightness: Brightness.dark, // Auto-adapted by Material 3
      ));
    }

    // Button size consistency is now handled by M3ExpressiveButtonStyles

    // Define the light theme using Material 3 Expressive
    final lightTheme = ThemeData(
      useMaterial3: true,
      applyElevationOverlayColor: true, // Important for Material 3 Expressive elevation shadows
      fontFamily: AppConstants.fontFamilyPrimary,
      scaffoldBackgroundColor: AppColors.light,
      brightness: Brightness.light,
      // Using M3 Expressive preset with enhanced settings for Android 16
      extensions: [
        const ExpressiveExtension(
          // Use expressive defaults for most properties, only configure what needs to be adjusted
          expressive: true,
          surfaceTintColor: Colors.transparent,  // Removes surface tints
          depthFactor: 0.9, // Enhanced depth for Android 16
          shadowStrength: 0.8, // Stronger shadows for better visibility on Pixel 9
          typeScaleFactor: 1.05, // Slightly larger text for expressive
        ),
      ],
      // Use the full Material 3 color scheme with explicit surface colors
      colorScheme: M3Colors.lightColorScheme(),
      // Use Material 3 Expressive typography
      textTheme: M3Typography.createExpressiveTextTheme(isLight: true),
      // Material 3 Expressive card theme
      cardTheme: CardThemeData(
        elevation: 4.0, // Higher elevation for more expressive depth
        shadowColor: Theme.of(context).colorScheme.shadow.withOpacity(0.9), // Stronger shadow
        surfaceTintColor: Colors.transparent, // Removes surface tint for cleaner look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // More pronounced rounded corners for expressive
          side: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.05), // Subtle border
            width: 0.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(AppSpacing.spacing8),
      ),
      // Material 3 Expressive app bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 3.0, // More pronounced elevation for Expressive
        shadowColor: Theme.of(context).colorScheme.shadow,
        titleTextStyle: M3Typography.createExpressiveTextTheme(isLight: true).titleLarge,
        toolbarHeight: 64.0, // Slightly taller for expressive design
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
          size: 24.0,
        ),
      ),
      // Material 3 Expressive input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing16,
          vertical: AppSpacing.spacing16,
        ),
        hintStyle: AppTextStyles.body3.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.8),
      ),
      // Material 3 Expressive button themes using our helper class for consistency
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: M3ExpressiveButtonStyles.elevatedButtonStyle(context, isDark: false),
      ),
      // FilledButton theme for Material 3 Expressive
      filledButtonTheme: FilledButtonThemeData(
        style: M3ExpressiveButtonStyles.filledButtonStyle(context, isDark: false),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: M3ExpressiveButtonStyles.outlinedButtonStyle(context, isDark: false),
      ),
      textButtonTheme: TextButtonThemeData(
        style: M3ExpressiveButtonStyles.textButtonStyle(context, isDark: false),
      ),
    );

    // Define the dark theme using Material 3 Expressive
    final darkTheme = ThemeData(
      useMaterial3: true,
      applyElevationOverlayColor: true, // Important for Material 3 Expressive elevation shadows
      brightness: Brightness.dark,
      fontFamily: AppConstants.fontFamilyPrimary,
      scaffoldBackgroundColor: AppColors.dark,
      // Using M3 Expressive preset with enhanced settings for Android 16
      extensions: [
        const ExpressiveExtension(
          expressive: true,
          surfaceTintColor: Colors.transparent,  // Removes surface tints
          shadowStrength: 0.90, // Enhanced shadows for OLED theme contrast on Pixel 9
          depthFactor: 0.95, // Higher depth effect for better contrast on Android 16
          typeScaleFactor: 1.05, // Consistent with light theme
        ),
      ],
      // Use the full Material 3 color scheme
      colorScheme: M3Colors.darkColorScheme(),
      // Use Material 3 Expressive typography
      textTheme: M3Typography.createExpressiveTextTheme(isLight: false),
      // Material 3 Expressive card theme for dark mode
      cardTheme: CardThemeData(
        elevation: 4.0, // Higher elevation for more contrast in dark mode
        shadowColor: Colors.black.withOpacity(0.9),
        surfaceTintColor: Colors.transparent, // Removes surface tint for cleaner look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Match light theme's rounded corners
          side: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.1), // Subtle border
            width: 0.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(AppSpacing.spacing8),
        color: AppColors.darkGrey.withOpacity(0.9), // Slightly lighter than pure black with some transparency
      ),
      // Material 3 Expressive app bar theme for dark mode
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 3.0,
        shadowColor: Colors.black,
        titleTextStyle: M3Typography.createExpressiveTextTheme(isLight: false).titleLarge,
        toolbarHeight: 64.0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
          size: 24.0,
        ),
      ),
      // Material 3 Expressive input decoration theme for dark mode
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing16,
          vertical: AppSpacing.spacing16,
        ),
        hintStyle: AppTextStyles.body3.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        filled: true,
        fillColor: AppColors.darkGrey.withOpacity(0.6),
      ),
      // Material 3 Expressive button themes for dark mode using our helper class
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: M3ExpressiveButtonStyles.elevatedButtonStyle(context, isDark: true),
      ),
      // FilledButton theme for Material 3 Expressive dark mode
      filledButtonTheme: FilledButtonThemeData(
        style: M3ExpressiveButtonStyles.filledButtonStyle(context, isDark: true),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: M3ExpressiveButtonStyles.outlinedButtonStyle(context, isDark: true),
      ),
      textButtonTheme: TextButtonThemeData(
        style: M3ExpressiveButtonStyles.textButtonStyle(context, isDark: true),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        modalBarrierColor: AppColors.neutral700.withAlpha(150),
      ),
    );

    return ToastificationWrapper(
      child: MaterialApp.router(
        key: rootKey,
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        // Apply Pixel-specific theme optimizations if needed
        theme: PlatformUtils.isPixelDevice 
            ? PixelThemeHelper.optimizeForPixel(lightTheme)
            : lightTheme,
        darkTheme: PlatformUtils.isPixelDevice 
            ? PixelThemeHelper.optimizeForPixel(darkTheme) 
            : darkTheme,
        themeMode: themeMode, // Set the theme mode from the provider
        // Enable optimizations for Material 3 Expressive
        highContrastTheme: null, 
        highContrastDarkTheme: null,
        // Set to true to ensure Material 3 Expressive animations on Android 16
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              // Enhanced text scaling for Material 3 Expressive legibility
              textScaler: MediaQuery.of(
                context,
              ).textScaler.clamp(minScaleFactor: 0.85, maxScaleFactor: 1.25),
            ),
            child: child!,
          ),
          breakpoints: [
            const Breakpoint(
              start: 0,
              end: AppConstants.mobileBreakpointEnd,
              name: MOBILE,
            ),
            const Breakpoint(
              start: AppConstants.tabletBreakpointStart,
              end: AppConstants.tabletBreakpointEnd,
              name: TABLET,
            ),
            const Breakpoint(
              start: AppConstants.desktopBreakpointStart,
              end: AppConstants.desktopBreakpointEnd,
              name: DESKTOP,
            ),
            const Breakpoint(
              start: AppConstants.fourKBreakpointStart,
              end: double.infinity,
              name: '4K',
            ),
          ],
        ),
        routerConfig: router,
      ),
    );
  }
}
