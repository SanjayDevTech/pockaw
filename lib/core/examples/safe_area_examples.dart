import 'package:flutter/material.dart';
import 'package:pockaw/core/components/safe_area/app_safe_area.dart';
import 'package:pockaw/core/utils/safe_area_utils.dart';

/// This file contains examples of how to implement safe area handling
/// throughout the app. It demonstrates the usage of the AppSafeArea component
/// and SafeAreaUtils helper methods.

class SafeAreaExamples extends StatelessWidget {
  const SafeAreaExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Example 1: Basic usage with default settings (top and bottom only)
          const AppSafeArea(
            child: Text('This respects top and bottom safe areas by default'),
          ),
          
          // Example 2: Safe area on bottom only (for buttons at screen bottom)
          const AppSafeArea.bottom(
            child: Text('This only respects bottom safe area'),
          ),
          
          // Example 3: Safe area on all sides
          const AppSafeArea.all(
            child: Text('This respects safe areas on all sides'),
          ),
          
          // Example 4: Using SafeAreaUtils to extend padding
          Container(
            padding: SafeAreaUtils.extendPadding(
              const EdgeInsets.all(16),
              context,
              bottom: true,
            ),
            child: const Text('This padding is extended with bottom safe area'),
          ),
          
          // Example 5: Manually applying safe area padding
          Container(
            padding: EdgeInsets.only(
              bottom: SafeAreaUtils.bottomPadding(context) + 16,
            ),
            child: const Text('Manual bottom safe area padding + 16px'),
          ),
          
          // Example 6: Bottom-aligned widget with safe area
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ).copyWith(
                bottom: 16 + MediaQuery.of(context).padding.bottom,
              ),
              color: Colors.blue.withOpacity(0.2),
              child: const Text(
                'Bottom-aligned widget with safe area padding',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}