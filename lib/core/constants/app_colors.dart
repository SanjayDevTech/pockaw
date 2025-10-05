import 'package:flutter/material.dart';

class AppColors {
  // Primary (Robin's Egg Blue) Color Scheme
  static const Color primary50 = Color(0xFFEEFFFD);
  static const Color primary100 = Color(0xFFC6FFFB);
  static const Color primary200 = Color(0xFF8EFFF8);
  static const Color primary300 = Color(0xFF4DFBF4);
  static const Color primary400 = Color(0xFF19E8E6);
  static const Color primary500 = Color(0xFF00CCCD);
  static const Color primary600 = Color(0xFF009FA4);
  static const Color primary700 = Color(0xFF027E83);
  static const Color primary800 = Color(0xFF086267);
  static const Color primary900 = Color(0xFF0C5255);
  static const Color primary950 = Color(0xFF002F34);
  static const Color primaryAlpha10 = Color(0x1A00CCCD);
  static const Color primaryAlpha25 = Color(0x4000CCCD);
  static const Color primaryAlpha50 = Color(0x8000CCCD);
  static const Color primaryAlpha75 = Color(0xBF00CCCD);
  static const Color primary = primary700;

  // Secondary (Electric Violet) Color Scheme
  static const Color secondary50 = Color(0xFFFBF4FF);
  static const Color secondary100 = Color(0xFFF7E8FF);
  static const Color secondary200 = Color(0xFFEFD0FE);
  static const Color secondary300 = Color(0xFFE5AAFD);
  static const Color secondary400 = Color(0xFFD778FA);
  static const Color secondary500 = Color(0xFFC244F1);
  static const Color secondary600 = Color(0xFFAD25DA);
  static const Color secondary700 = Color(0xFF8E1AB1);
  static const Color secondary800 = Color(0xFF761890);
  static const Color secondary900 = Color(0xFF641976);
  static const Color secondary950 = Color(0xFF40034F);
  static const Color secondaryAlpha10 = Color(0x1AAD25DA);
  static const Color secondaryAlpha25 = Color(0x40AD25DA);
  static const Color secondaryAlpha50 = Color(0x80AD25DA);
  static const Color secondaryAlpha75 = Color(0xBFAD25DA);
  static const Color secondary = secondary700;

  // Tertiary (Bird Flower) Color Scheme
  static const Color tertiary50 = Color(0xFFFBFCEA);
  static const Color tertiary100 = Color(0xFFF4F9C8);
  static const Color tertiary200 = Color(0xFFEEF494);
  static const Color tertiary300 = Color(0xFFEBEE56);
  static const Color tertiary400 = Color(0xFFE7E328);
  static const Color tertiary500 = Color(0xFFD8CC1B);
  static const Color tertiary600 = Color(0xFFB9A115);
  static const Color tertiary700 = Color(0xFF947714);
  static const Color tertiary800 = Color(0xFF7B5E18);
  static const Color tertiary900 = Color(0xFF694D1A);
  static const Color tertiary950 = Color(0xFF3D2A0B);
  static const Color tertiaryAlpha10 = Color(0x1AD8CC1B);
  static const Color tertiaryAlpha25 = Color(0x40D8CC1B);
  static const Color tertiaryAlpha50 = Color(0x80D8CC1B);
  static const Color tertiaryAlpha75 = Color(0xBFD8CC1B);
  static const Color tertiary = tertiary600;

  // Red (Razzmatazz) Color Scheme
  static const Color red50 = Color(0xFFFFF0F3);
  static const Color red100 = Color(0xFFFFE1E8);
  static const Color red200 = Color(0xFFFFC8D6);
  static const Color red300 = Color(0xFFFF9BB5);
  static const Color red400 = Color(0xFFFF638F);
  static const Color red500 = Color(0xFFFF2C6D);
  static const Color red600 = Color(0xFFE50855);
  static const Color red700 = Color(0xFFD0004E);
  static const Color red800 = Color(0xFFAE0348);
  static const Color red900 = Color(0xFF940744);
  static const Color red950 = Color(0xFF530021);
  static const Color redAlpha10 = Color(0x1AE50855);
  static const Color redAlpha25 = Color(0x40E50855);
  static const Color redAlpha50 = Color(0x80E50855);
  static const Color redAlpha75 = Color(0xBFE50855);
  static const Color red = red600;

  // Purple (Purple Heart) Color Scheme
  static const Color purple50 = Color(0xFFF6F3FF);
  static const Color purple100 = Color(0xFFEDE8FF);
  static const Color purple200 = Color(0xFFDED4FF);
  static const Color purple300 = Color(0xFFC5B2FF);
  static const Color purple400 = Color(0xFFAA86FF);
  static const Color purple500 = Color(0xFF9156FC);
  static const Color purple600 = Color(0xFF8333F4);
  static const Color purple700 = Color(0xFF731FE0);
  static const Color purple800 = Color(0xFF611BBC);
  static const Color purple900 = Color(0xFF51189A);
  static const Color purple950 = Color(0xFF310D68);
  static const Color purpleAlpha10 = Color(0x1A731FE0);
  static const Color purpleAlpha25 = Color(0x40731FE0);
  static const Color purpleAlpha50 = Color(0x80731FE0);
  static const Color purpleAlpha75 = Color(0xBF731FE0);
  static const Color purple = purple700;

  // Neutral Color Scheme
  static const Color neutral50 = Color(0xFFFDFDFD);
  static const Color neutral100 = Color(0xFFE7E7E7);
  static const Color neutral200 = Color(0xFFD1D1D1);
  static const Color neutral300 = Color(0xFFB0B0B0);
  static const Color neutral400 = Color(0xFF888888);
  static const Color neutral500 = Color(0xFF6D6D6D);
  static const Color neutral600 = Color(0xFF5D5D5D);
  static const Color neutral700 = Color(0xFF4F4F4F);
  static const Color neutral800 = Color(0xFF454545);
  static const Color neutral900 = Color(0xFF3D3D3D);
  static const Color neutral950 = Color(0xFF1C1C1C);
  static const Color neutralAlpha10 = Color(0x1A545454);
  static const Color neutralAlpha25 = Color(0x40545454);
  static const Color neutralAlpha50 = Color(0x80545454);
  static const Color neutralAlpha75 = Color(0xBF545454);

  // Neutral Colors
  static const Color light = neutral50;
  static const Color dark = Color(0xFF000000); // Pure black for OLED screens

  // Specific Dark Grey for Alpha Variants
  static const Color darkGrey = Color(
    0xFF121212,
  ); // Adjusted for better contrast with pure black
  static const Color darkGreyBorder = Color(
    0xFF1F1F1F,
  );

  static const Color navigationBarBackground = Color(
    0xFF0A0A0A,
  ); // Subtle contrast for bottom navigation bar in OLED mode
  static Color get darkAlpha10 => darkGrey.withAlpha(10);
  static Color get darkAlpha30 => darkGrey.withAlpha(30);
  static Color get darkAlpha50 => darkGrey.withAlpha(60);

  // Green Color Shades
  static const Color green100 = Color(0xFF52DF83);
  static const Color green200 = Color(0xFF21B354);

  // Green Alpha Variant
  static const Color greenAlpha10 = Color(0x1A52DF83);
  static const Color greenAlpha20 = Color(0x3252DF83);
  static const Color greenAlpha30 = Color(0x4D52DF83);
  static const Color greenAlpha50 = Color(0x8052DF83);
}

extension ColorExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Color get primaryText =>
      themeMode == ThemeMode.dark ? AppColors.primary400 : AppColors.primary;

  Color get secondaryBackground => themeMode == ThemeMode.dark
      ? AppColors.secondaryAlpha10
      : AppColors.secondary50;

  Color get secondaryButtonBackground => themeMode == ThemeMode.dark
      ? AppColors.secondaryAlpha10
      : AppColors.secondary100;

  Color get secondaryBackgroundSolid => themeMode == ThemeMode.dark
      ? AppColors.secondary950
      : AppColors.secondary50;

  Color get secondaryText => themeMode == ThemeMode.dark
      ? AppColors.secondary200
      : AppColors.secondary950;

  Color get secondaryBorder => themeMode == ThemeMode.dark
      ? AppColors.secondaryAlpha25
      : AppColors.secondary200;

  Color get secondaryBorderLighter => themeMode == ThemeMode.dark
      ? AppColors.secondaryAlpha10
      : AppColors.secondary200;

  Color get incomeBackground => AppColors.primaryAlpha10;

  Color get incomeForeground =>
      themeMode == ThemeMode.dark ? AppColors.neutral50 : AppColors.neutral900;

  Color get incomeText =>
      themeMode == ThemeMode.dark ? AppColors.green200 : AppColors.green200;

  Color get incomeLine => themeMode == ThemeMode.dark
      ? AppColors.primaryAlpha10
      : AppColors.primaryAlpha25;

  Color get expenseBackground =>
      themeMode == ThemeMode.dark ? AppColors.redAlpha10 : AppColors.red50;

  Color get expenseStatsBackground => AppColors.redAlpha10;

  Color get expenseForeground =>
      themeMode == ThemeMode.dark ? AppColors.neutral50 : AppColors.red800;

  Color get expenseText =>
      themeMode == ThemeMode.dark ? AppColors.red700 : AppColors.red700;

  Color get expenseLine =>
      themeMode == ThemeMode.dark ? AppColors.redAlpha10 : AppColors.redAlpha10;

  Color get purpleBackground => themeMode == ThemeMode.dark
      ? AppColors.neutralAlpha25
      : AppColors.purple50;

  Color get purpleBackgroundActive =>
      themeMode == ThemeMode.dark ? AppColors.purple : AppColors.purple400;

  Color get purpleButtonBackground => themeMode == ThemeMode.dark
      ? AppColors.purpleAlpha10
      : AppColors.purple100;

  Color get purpleButtonBorder => themeMode == ThemeMode.dark
      ? AppColors.purpleAlpha50
      : AppColors.purple200;

  Color get purpleBorder =>
      themeMode == ThemeMode.dark ? AppColors.purpleAlpha50 : AppColors.purple;

  Color get purpleBorderLighter => themeMode == ThemeMode.dark
      ? AppColors.neutralAlpha25
      : AppColors.purpleAlpha10;

  Color get purpleProgressBackground => themeMode == ThemeMode.dark
      ? AppColors.purpleAlpha25
      : AppColors.purpleAlpha10;

  Color get purpleProgressColor =>
      themeMode == ThemeMode.dark ? AppColors.purple600 : AppColors.purple600;

  Color get purpleText =>
      themeMode == ThemeMode.dark ? AppColors.purple300 : AppColors.purple;

  Color get purpleIcon =>
      themeMode == ThemeMode.dark ? AppColors.purple200 : AppColors.purple;

  Color get purpleIconActive =>
      themeMode == ThemeMode.dark ? AppColors.purple50 : AppColors.purple100;

  Color get floatingContainer =>
      themeMode == ThemeMode.dark ? AppColors.dark : AppColors.light;
      
  Color get navigationBar =>
      themeMode == ThemeMode.dark ? AppColors.navigationBarBackground : AppColors.light;

  Color get disabledText =>
      themeMode == ThemeMode.dark ? AppColors.neutral700 : AppColors.neutral400;

  Color get progressBackground => themeMode == ThemeMode.dark
      ? AppColors.neutral900
      : AppColors.purpleAlpha10;

  Color get placeholderBackground =>
      themeMode == ThemeMode.dark ? AppColors.neutral500 : AppColors.neutral100;

  Color get breakLineColor =>
      themeMode == ThemeMode.dark ? AppColors.neutral700 : AppColors.neutral100;
}
