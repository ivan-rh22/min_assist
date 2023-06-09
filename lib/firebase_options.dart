// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

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
    apiKey: 'AIzaSyCc0Si89C-Y9qwI8hJkFvYOblAKZHwfLRg',
    appId: '1:879896772429:web:849cf8715c578b47564104',
    messagingSenderId: '879896772429',
    projectId: 'ministry-assistant-57753',
    authDomain: 'ministry-assistant-57753.firebaseapp.com',
    storageBucket: 'ministry-assistant-57753.appspot.com',
    measurementId: 'G-5GRKT64KTT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBA6dSwdQZa6RQEFHy70QI9-ma98x7NcMo',
    appId: '1:879896772429:android:1d0377af4a06512f564104',
    messagingSenderId: '879896772429',
    projectId: 'ministry-assistant-57753',
    storageBucket: 'ministry-assistant-57753.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBl0qewi_wRPLOzJy3Pxo5hesCsnJKL0PA',
    appId: '1:879896772429:ios:f5b28f3cee5eb3a5564104',
    messagingSenderId: '879896772429',
    projectId: 'ministry-assistant-57753',
    storageBucket: 'ministry-assistant-57753.appspot.com',
    iosClientId:
        '879896772429-eqj70a8s698aa3v906spjhtuqkqv9mvk.apps.googleusercontent.com',
    iosBundleId: 'com.example.minAssist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBl0qewi_wRPLOzJy3Pxo5hesCsnJKL0PA',
    appId: '1:879896772429:ios:f5b28f3cee5eb3a5564104',
    messagingSenderId: '879896772429',
    projectId: 'ministry-assistant-57753',
    storageBucket: 'ministry-assistant-57753.appspot.com',
    iosClientId:
        '879896772429-eqj70a8s698aa3v906spjhtuqkqv9mvk.apps.googleusercontent.com',
    iosBundleId: 'com.example.minAssist',
  );
}
