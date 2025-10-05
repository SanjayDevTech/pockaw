import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pockaw/core/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pockaw/core/utils/platform_utils.dart';
import 'package:pockaw/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Material 3 Expressive rendering optimizations are applied in theme configuration
  // No additional setup needed here for Android 16 QPR1
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'pockaw', // Give it a unique name to avoid conflicts
    );
  } catch (e) {
    // If Firebase is already initialized, get the existing instance
    Firebase.app('pockaw');
  }
  
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  
  // Apply platform-specific optimizations via app wrapper
  runApp(ProviderScope(child: const MyApp()));
}
