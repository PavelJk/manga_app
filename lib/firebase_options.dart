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
    apiKey: 'AIzaSyCRK1V1yvUN1BpltYyAxCinph_RBEmXXmg',
    appId: '1:730562427931:web:36c4302180aad4b2fa8cbe',
    messagingSenderId: '730562427931',
    projectId: 'manga-app-507a1',
    authDomain: 'manga-app-507a1.firebaseapp.com',
    storageBucket: 'manga-app-507a1.appspot.com',
    measurementId: 'G-1EEGN7KQ0J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmARjj8_Znh08aeverh_eKe_QJo_u8AxE',
    appId: '1:730562427931:android:dbccd8ccb81b4cc0fa8cbe',
    messagingSenderId: '730562427931',
    projectId: 'manga-app-507a1',
    storageBucket: 'manga-app-507a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJfq1Grk_dDNC6CLHH9ot622-0FqECb90',
    appId: '1:730562427931:ios:68840fc5e732df92fa8cbe',
    messagingSenderId: '730562427931',
    projectId: 'manga-app-507a1',
    storageBucket: 'manga-app-507a1.appspot.com',
    iosBundleId: 'com.example.mangaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJfq1Grk_dDNC6CLHH9ot622-0FqECb90',
    appId: '1:730562427931:ios:8de610aabb725642fa8cbe',
    messagingSenderId: '730562427931',
    projectId: 'manga-app-507a1',
    storageBucket: 'manga-app-507a1.appspot.com',
    iosBundleId: 'com.example.mangaApp.RunnerTests',
  );
}
