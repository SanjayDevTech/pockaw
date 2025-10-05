import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pockaw/core/constants/app_colors.dart';
import 'package:pockaw/core/constants/app_constants.dart';
import 'package:pockaw/core/constants/app_spacing.dart';
import 'package:pockaw/core/constants/app_text_styles.dart';
import 'package:pockaw/core/theme/expressive_theme.dart';
import 'package:pockaw/core/theme/m3_colors.dart';
import 'package:pockaw/core/theme/m3_typography.dart';
import 'package:pockaw/core/router/app_router.dart';
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

    // Define standard button size for consistency
    const buttonMinimumSize = Size.fromHeight(48);

    // Define the light theme using Material 3 Expressive
    final lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamilyPrimary,
      scaffoldBackgroundColor: AppColors.light,
      brightness: Brightness.light,
      // Using M3 Expressive preset
      extensions: [
        const ExpressiveExtension(
          // Use expressive defaults for most properties, only configure what needs to be adjusted
          expressive: true,
          surfaceTintColor: Colors.transparent,  // Removes surface tints
        ),
      ],
      // Use the full Material 3 color scheme
      colorScheme: M3Colors.lightColorScheme(),
      // Use Material 3 Expressive typography
      textTheme: M3Typography.createExpressiveTextTheme(isLight: true),
      // Material 3 Expressive card theme
      cardTheme: CardThemeData(
        elevation: 3.0,
        shadowColor: Theme.of(context).colorScheme.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // More rounded for expressive
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
      // Material 3 Expressive button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: buttonMinimumSize,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing24,
            vertical: AppSpacing.spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Slightly more rounded for expressive
          ),
          elevation: 3, // Increased elevation for expressive design
          shadowColor: Theme.of(context).colorScheme.shadow,
        ),
      ),
      // FilledButton theme for Material 3 Expressive
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: buttonMinimumSize,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing24,
            vertical: AppSpacing.spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 1, // Subtle elevation for filled buttons
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(AppSpacing.spacing20),
          backgroundColor: Theme.of(context).colorScheme.surface,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5, // Slightly thicker border for expressive design
          ),
          minimumSize: buttonMinimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: buttonMinimumSize,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing16,
            vertical: AppSpacing.spacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );

    // Define the dark theme using Material 3 Expressive
    final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppConstants.fontFamilyPrimary,
      scaffoldBackgroundColor: AppColors.dark,
      // Using M3 Expressive preset
      extensions: [
        const ExpressiveExtension(
          expressive: true,
          surfaceTintColor: Colors.transparent,  // Removes surface tints
          shadowStrength: 0.85, // Stronger shadows for OLED theme contrast
          depthFactor: 0.9, // Higher depth effect for better contrast
        ),
      ],
      // Use the full Material 3 color scheme
      colorScheme: M3Colors.darkColorScheme(),
      // Use Material 3 Expressive typography
      textTheme: M3Typography.createExpressiveTextTheme(isLight: false),
      // Material 3 Expressive card theme for dark mode
      cardTheme: CardThemeData(
        elevation: 4.0, // Higher elevation for more contrast in dark mode
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(AppSpacing.spacing8),
        color: AppColors.darkGrey, // Slightly lighter than pure black background
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
      // Material 3 Expressive button themes for dark mode
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: buttonMinimumSize,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing24,
            vertical: AppSpacing.spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Slightly more rounded for expressive
          ),
          elevation: 4, // Higher elevation for dark theme contrast
          shadowColor: Colors.black,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      // FilledButton theme for Material 3 Expressive dark mode
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: buttonMinimumSize,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing24,
            vertical: AppSpacing.spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 2, // Slightly higher elevation for dark mode
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(AppSpacing.spacing20),
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5, // Slightly thicker border for expressive design
          ),
          minimumSize: buttonMinimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: buttonMinimumSize,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing16,
            vertical: AppSpacing.spacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
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
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode, // Set the theme mode from the provider
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: MediaQuery.of(
                context,
              ).textScaler.clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2),
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
