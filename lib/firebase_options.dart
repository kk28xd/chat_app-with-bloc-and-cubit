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
    apiKey: 'AIzaSyBHk91i1QvsO70H6dUr1vgTFwO5M44cpGE',
    appId: '1:844287528424:web:d1bcee0dea2ef3ed34e85d',
    messagingSenderId: '844287528424',
    projectId: 'chat-app-8190c',
    authDomain: 'chat-app-8190c.firebaseapp.com',
    storageBucket: 'chat-app-8190c.appspot.com',
    measurementId: 'G-L46TV6TX3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdK4a0prnaX3eCSXOyg9VlAmuVdbryUr8',
    appId: '1:844287528424:android:a67c7c7c4c239bb834e85d',
    messagingSenderId: '844287528424',
    projectId: 'chat-app-8190c',
    storageBucket: 'chat-app-8190c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB85aPkIlQJO0oE-VlYs-LiT5h8ZoFwM-E',
    appId: '1:844287528424:ios:fbb93e46a9754f1034e85d',
    messagingSenderId: '844287528424',
    projectId: 'chat-app-8190c',
    storageBucket: 'chat-app-8190c.appspot.com',
    iosBundleId: 'com.example.flutterProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB85aPkIlQJO0oE-VlYs-LiT5h8ZoFwM-E',
    appId: '1:844287528424:ios:bd1ddb549533edc634e85d',
    messagingSenderId: '844287528424',
    projectId: 'chat-app-8190c',
    storageBucket: 'chat-app-8190c.appspot.com',
    iosBundleId: 'com.example.flutterProject.RunnerTests',
  );
}