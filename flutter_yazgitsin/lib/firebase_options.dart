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
    apiKey: 'AIzaSyD9LHIRB2m4UMSh_1C-kKeTu5NQ528RrNY',
    appId: '1:258795206142:web:1c134c2dfda4ea18977caf',
    messagingSenderId: '258795206142',
    projectId: 'flutter-yazgitsin',
    authDomain: 'flutter-yazgitsin.firebaseapp.com',
    storageBucket: 'flutter-yazgitsin.appspot.com',
    measurementId: 'G-QYZXWL75G2',
    databaseURL: "https://flutter-yazgitsin-default-rtdb.europe-west1.firebasedatabase.app"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt4WCsxwt8f5digMJZcWryQpuDzUyddoE',
    appId: '1:258795206142:android:e8a981c858cca0e6977caf',
    messagingSenderId: '258795206142',
    projectId: 'flutter-yazgitsin',
    storageBucket: 'flutter-yazgitsin.appspot.com',
    databaseURL: "https://flutter-yazgitsin-default-rtdb.europe-west1.firebasedatabase.app"
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfBEB1XtkbdEn-9-xQoPjweaUd_uOtuog',
    appId: '1:258795206142:ios:975892d0d47a3a29977caf',
    messagingSenderId: '258795206142',
    projectId: 'flutter-yazgitsin',
    storageBucket: 'flutter-yazgitsin.appspot.com',
    iosClientId: '258795206142-nt7gbqpn32b9jvc0pi7jtm1q8el3v97e.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterYazgitsin',
    databaseURL: "https://flutter-yazgitsin-default-rtdb.europe-west1.firebasedatabase.app"
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfBEB1XtkbdEn-9-xQoPjweaUd_uOtuog',
    appId: '1:258795206142:ios:975892d0d47a3a29977caf',
    messagingSenderId: '258795206142',
    projectId: 'flutter-yazgitsin',
    storageBucket: 'flutter-yazgitsin.appspot.com',
    iosClientId: '258795206142-nt7gbqpn32b9jvc0pi7jtm1q8el3v97e.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterYazgitsin',
    databaseURL: "https://flutter-yazgitsin-default-rtdb.europe-west1.firebasedatabase.app"
  );
}
