// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'firebase_options.dart';

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
    apiKey: 'AIzaSyAZHnHnBzFIKDrXVu_GNAB7Dch4-wv7v_g',
    appId: '1:264474699701:web:51082c7e9e1cb541711bfc',
    messagingSenderId: '264474699701',
    projectId: 'chat-flutter-9be26',
    authDomain: 'chat-flutter-9be26.firebaseapp.com',
    storageBucket: 'chat-flutter-9be26.firebasestorage.app',
    measurementId: 'G-B8EFMLB6KN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqQbyhs83DdYGPCvEI_QHnKPLOhAmzhmE',
    appId: '1:264474699701:android:188ca55d3b4a11a2711bfc',
    messagingSenderId: '264474699701',
    projectId: 'chat-flutter-9be26',
    storageBucket: 'chat-flutter-9be26.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLVEBnR8Mngx2JpXKKnjqoIgCkAfv_BMA',
    appId: '1:264474699701:ios:f7f8a452b1ffa080711bfc',
    messagingSenderId: '264474699701',
    projectId: 'chat-flutter-9be26',
    storageBucket: 'chat-flutter-9be26.firebasestorage.app',
    iosBundleId: 'com.example.quizoFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLVEBnR8Mngx2JpXKKnjqoIgCkAfv_BMA',
    appId: '1:264474699701:ios:f7f8a452b1ffa080711bfc',
    messagingSenderId: '264474699701',
    projectId: 'chat-flutter-9be26',
    storageBucket: 'chat-flutter-9be26.firebasestorage.app',
    iosBundleId: 'com.example.quizoFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZHnHnBzFIKDrXVu_GNAB7Dch4-wv7v_g',
    appId: '1:264474699701:web:84e4bf1a63b622ae711bfc',
    messagingSenderId: '264474699701',
    projectId: 'chat-flutter-9be26',
    authDomain: 'chat-flutter-9be26.firebaseapp.com',
    storageBucket: 'chat-flutter-9be26.firebasestorage.app',
    measurementId: 'G-YY0TQ3BMHB',
  );
}