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
    apiKey: 'AIzaSyCrOpZ5DCaCtOT5POT1t7CI4G8lSp5bcSw',
    appId: '1:215428565320:web:16580d394f4acd1fbb4b7d',
    messagingSenderId: '215428565320',
    projectId: 'note-app-60054',
    authDomain: 'note-app-60054.firebaseapp.com',
    storageBucket: 'note-app-60054.appspot.com',
    measurementId: 'G-8Z6JCGY8TK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAp8LnHrU6WlX-xsX5emRzPVn15KRivvNA',
    appId: '1:215428565320:android:9310abe88987878dbb4b7d',
    messagingSenderId: '215428565320',
    projectId: 'note-app-60054',
    storageBucket: 'note-app-60054.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK-5ILaZURs1F55fky9tHGOe8aDQ5wUuY',
    appId: '1:215428565320:ios:c5d6871671f5eaa9bb4b7d',
    messagingSenderId: '215428565320',
    projectId: 'note-app-60054',
    storageBucket: 'note-app-60054.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAK-5ILaZURs1F55fky9tHGOe8aDQ5wUuY',
    appId: '1:215428565320:ios:b87168ce5b960fcbbb4b7d',
    messagingSenderId: '215428565320',
    projectId: 'note-app-60054',
    storageBucket: 'note-app-60054.appspot.com',
    iosBundleId: 'com.example.noteApp.RunnerTests',
  );
}
