// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDxPZMPm8WLJX1LHwuGSpMLx4Zeg21rDcw',
    appId: '1:578756183889:web:a6f1629fb935d4698d7570',
    messagingSenderId: '578756183889',
    projectId: 'serverless-1a08f',
    authDomain: 'serverless-1a08f.firebaseapp.com',
    storageBucket: 'serverless-1a08f.appspot.com',
    measurementId: 'G-PWNDGVGFDE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFk-agVyHBEUUM4GgjVPywbx2oef9QWZM',
    appId: '1:578756183889:android:5c56152de9b977748d7570',
    messagingSenderId: '578756183889',
    projectId: 'serverless-1a08f',
    storageBucket: 'serverless-1a08f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpnsDb5vQP0d32i3xCJyF2_7GEEcm4SVk',
    appId: '1:578756183889:ios:8b5487017324c4c48d7570',
    messagingSenderId: '578756183889',
    projectId: 'serverless-1a08f',
    storageBucket: 'serverless-1a08f.appspot.com',
    iosBundleId: 'com.serverlessexample.serverlessExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpnsDb5vQP0d32i3xCJyF2_7GEEcm4SVk',
    appId: '1:578756183889:ios:8b5487017324c4c48d7570',
    messagingSenderId: '578756183889',
    projectId: 'serverless-1a08f',
    storageBucket: 'serverless-1a08f.appspot.com',
    iosBundleId: 'com.serverlessexample.serverlessExample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxPZMPm8WLJX1LHwuGSpMLx4Zeg21rDcw',
    appId: '1:578756183889:web:94d10d5d3de79c648d7570',
    messagingSenderId: '578756183889',
    projectId: 'serverless-1a08f',
    authDomain: 'serverless-1a08f.firebaseapp.com',
    storageBucket: 'serverless-1a08f.appspot.com',
    measurementId: 'G-TC92R6EQYL',
  );

}