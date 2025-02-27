// @dart = 2.9
import 'package:exerlog/src/feature/onboarding/splash/view/splash_screen.dart';
import 'package:exerlog/src/utils/logger/logger.dart';
import 'package:exerlog/src/utils/logger/riverpod_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/base/shared_preference/shared_preference_b.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Device orientation locked to portrait up
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// Initialize shared preference
  try {
    await SharedPref.initializeSharedPreference();
  } catch (e, stackTrace) {
    Log.error(e.toString(), stackTrace: stackTrace);
    throw ErrorDescription(e);
  }

  /// Initialize firebase
  await Firebase.initializeApp();

  /// A widget that stores the state of providers.
  /// All Flutter applications using Riverpod must contain a [ProviderScope] at
  /// the root of their widget tree
  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'EXERLOG',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
