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
        return ios;
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
    apiKey: 'AIzaSyCjXrJxTY_VYzcEwPl3qZCTa0y83eSkFz8',
    appId: '1:138923490333:web:a901a33004a2584f609af4',
    messagingSenderId: '138923490333',
    projectId: 'todoflutter-9650f',
    authDomain: 'todoflutter-9650f.firebaseapp.com',
    databaseURL: 'https://todoflutter-9650f-default-rtdb.firebaseio.com',
    storageBucket: 'todoflutter-9650f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1DOmXa49kIkQQ0b8_1PQRF_Lg5qZUhJ4',
    appId: '1:138923490333:android:a3ce157514c78b9e609af4',
    messagingSenderId: '138923490333',
    projectId: 'todoflutter-9650f',
    databaseURL: 'https://todoflutter-9650f-default-rtdb.firebaseio.com',
    storageBucket: 'todoflutter-9650f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEqJZQYToWCpFQkYe5F7WRwwFNC4_2-_0',
    appId: '1:138923490333:ios:769c894fa83394f3609af4',
    messagingSenderId: '138923490333',
    projectId: 'todoflutter-9650f',
    databaseURL: 'https://todoflutter-9650f-default-rtdb.firebaseio.com',
    storageBucket: 'todoflutter-9650f.appspot.com',
    iosClientId: '138923490333-gg1ieia69eim361c32tmhiaecr0njifb.apps.googleusercontent.com',
    iosBundleId: 'com.example.todolist',
  );
}
