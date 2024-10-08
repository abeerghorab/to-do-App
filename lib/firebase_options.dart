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
    apiKey: 'AIzaSyDsBA95rQ8n71DWQiFc16u3h5Zk_AHpZsQ',
    appId: '1:441357223488:web:66e70c0ede5b913edc01a5',
    messagingSenderId: '441357223488',
    projectId: 'to-do-app-6b161',
    authDomain: 'to-do-app-6b161.firebaseapp.com',
    storageBucket: 'to-do-app-6b161.appspot.com',
    measurementId: 'G-1MCQFPE72D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYGjBWzT9k1pwts2fJNU_loP9dnID7-28',
    appId: '1:441357223488:android:a359a9d02ef926d9dc01a5',
    messagingSenderId: '441357223488',
    projectId: 'to-do-app-6b161',
    storageBucket: 'to-do-app-6b161.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2F50_yFGGNhIFCnyBwLa1D2BqrGkD_Vo',
    appId: '1:441357223488:ios:fc5e864143a2932bdc01a5',
    messagingSenderId: '441357223488',
    projectId: 'to-do-app-6b161',
    storageBucket: 'to-do-app-6b161.appspot.com',
    iosBundleId: 'com.example.todo2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2F50_yFGGNhIFCnyBwLa1D2BqrGkD_Vo',
    appId: '1:441357223488:ios:962ad28d65afea0ddc01a5',
    messagingSenderId: '441357223488',
    projectId: 'to-do-app-6b161',
    storageBucket: 'to-do-app-6b161.appspot.com',
    iosBundleId: 'com.example.todo2.RunnerTests',
  );
}
