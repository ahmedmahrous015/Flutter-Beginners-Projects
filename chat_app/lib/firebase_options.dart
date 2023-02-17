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
    apiKey: 'AIzaSyB0KdyKRpBfa-kvL7RTkRsAvcZCMNTJqjI',
    appId: '1:625238432010:web:4f73d9e669e89b336942f3',
    messagingSenderId: '625238432010',
    projectId: 'chat-app-dec93',
    authDomain: 'chat-app-dec93.firebaseapp.com',
    storageBucket: 'chat-app-dec93.appspot.com',
    measurementId: 'G-L8XHGCJMMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXMByC3KWIVy1Qw4c-vPHrZxGpBfbyq5o',
    appId: '1:625238432010:android:1c4d60da09d169b56942f3',
    messagingSenderId: '625238432010',
    projectId: 'chat-app-dec93',
    storageBucket: 'chat-app-dec93.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdUHaqw-8rrwV_f93PPyO9ZEVQ40IQpSo',
    appId: '1:625238432010:ios:77fdf22e783af3af6942f3',
    messagingSenderId: '625238432010',
    projectId: 'chat-app-dec93',
    storageBucket: 'chat-app-dec93.appspot.com',
    iosClientId: '625238432010-7pl34j5j7847nl34q6od0hf10b76bc6b.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}