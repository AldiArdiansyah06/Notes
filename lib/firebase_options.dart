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
    apiKey: 'AIzaSyAgtseowrDeQkivsYcKaV0IpESvE5Z23To',
    appId: '1:654121681836:web:689b2eb2ee69d2dd3d3009',
    messagingSenderId: '654121681836',
    projectId: 'notes-1b67e',
    authDomain: 'notes-1b67e.firebaseapp.com',
    databaseURL: 'https://notes-1b67e-default-rtdb.firebaseio.com',
    storageBucket: 'notes-1b67e.appspot.com',
    measurementId: 'G-JF0VVELQP8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC825I4sXPzIC19wDHA8DHjm10pLmIjQk',
    appId: '1:654121681836:android:bdbdb494cb43f8683d3009',
    messagingSenderId: '654121681836',
    projectId: 'notes-1b67e',
    databaseURL: 'https://notes-1b67e-default-rtdb.firebaseio.com',
    storageBucket: 'notes-1b67e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGsUn_ozIztY2HtbbdVhDg5dVF3WY4Zeg',
    appId: '1:654121681836:ios:178d5af72f871f203d3009',
    messagingSenderId: '654121681836',
    projectId: 'notes-1b67e',
    databaseURL: 'https://notes-1b67e-default-rtdb.firebaseio.com',
    storageBucket: 'notes-1b67e.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGsUn_ozIztY2HtbbdVhDg5dVF3WY4Zeg',
    appId: '1:654121681836:ios:178d5af72f871f203d3009',
    messagingSenderId: '654121681836',
    projectId: 'notes-1b67e',
    databaseURL: 'https://notes-1b67e-default-rtdb.firebaseio.com',
    storageBucket: 'notes-1b67e.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAgtseowrDeQkivsYcKaV0IpESvE5Z23To',
    appId: '1:654121681836:web:c41237b5e28637313d3009',
    messagingSenderId: '654121681836',
    projectId: 'notes-1b67e',
    authDomain: 'notes-1b67e.firebaseapp.com',
    databaseURL: 'https://notes-1b67e-default-rtdb.firebaseio.com',
    storageBucket: 'notes-1b67e.appspot.com',
    measurementId: 'G-T15EF3D48J',
  );

}