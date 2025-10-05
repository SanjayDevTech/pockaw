# Safe Area Implementation Guide

This guide explains how to properly handle safe areas in the Pockaw app to ensure content is displayed correctly on all devices, including those with notches, cutouts, or gesture navigation bars.

## Components Available

### 1. AppSafeArea Widget

A custom SafeArea wrapper that provides consistent safe area behavior throughout the app:

```dart
// Basic usage (applies safe area to top and bottom only)
AppSafeArea(
  child: YourWidget(),
)

// Bottom safe area only (good for buttons at bottom of screen)
AppSafeArea.bottom(
  child: YourWidget(),
)

// Top safe area only
AppSafeArea.top(
  child: YourWidget(),
)

// All sides safe area
AppSafeArea.all(
  child: YourWidget(),
)
```

### 2. SafeAreaUtils

Helper methods for applying safe area insets to custom widgets:

```dart
// Get bottom safe area padding
final bottomPadding = SafeAreaUtils.bottomPadding(context);

// Apply safe area to existing padding
final paddingWithSafeArea = SafeAreaUtils.extendPadding(
  EdgeInsets.all(16),
  context,
  bottom: true,
);
```

## Common Use Cases

### Custom Scaffold

The `CustomScaffold` already handles safe areas for its body content. The body is wrapped in a SafeArea with `bottom: false` to allow the navigation bar to handle its own bottom padding.

### Bottom Navigation

In mobile layouts, the bottom navigation bar adds padding for the safe area:

```dart
// From main_screen.dart
Positioned(
  bottom: MediaQuery.of(context).padding.bottom + AppSpacing.spacing8,
  left: AppSpacing.spacing8,
  right: AppSpacing.spacing8,
  child: navigationControls,
),
```

### Bottom Sheets

Bottom sheets automatically respect safe areas with `useSafeArea: true` parameter:

```dart
showModalBottomSheet(
  context: context,
  useSafeArea: true,
  builder: (context) => YourWidget(),
)
```

### Bottom-Aligned Buttons

For widgets that need to align to the bottom of the screen:

```dart
Container(
  padding: EdgeInsets.symmetric(
    vertical: 16,
    horizontal: 16,
  ).copyWith(
    bottom: 16 + MediaQuery.of(context).padding.bottom,
  ),
  child: YourWidget(),
)
```

## Best Practices

1. Use `AppSafeArea` for most cases where you need safe area handling
2. For custom layouts, use `SafeAreaUtils` to manually apply safe area insets
3. Bottom sheets should always set `useSafeArea: true`
4. Bottom navigation and action buttons should add the bottom safe area padding

See `lib/core/examples/safe_area_examples.dart` for more usage examples.