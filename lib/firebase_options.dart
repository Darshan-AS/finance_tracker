// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB_2z1L2z2SuRMNaJIsWbDWyDOP87fwnhI',
    appId: '1:222226759648:web:a50ec513e6ee1f277a3585',
    messagingSenderId: '222226759648',
    projectId: 'finance-tracker-84ea0',
    authDomain: 'finance-tracker-84ea0.firebaseapp.com',
    storageBucket: 'finance-tracker-84ea0.appspot.com',
    measurementId: 'G-H50EPE3ZGG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmFcsQDajQns5GLHC4U2kmTtcy_aaErAo',
    appId: '1:222226759648:android:b213d4fb94a9a00a7a3585',
    messagingSenderId: '222226759648',
    projectId: 'finance-tracker-84ea0',
    storageBucket: 'finance-tracker-84ea0.appspot.com',
  );
}