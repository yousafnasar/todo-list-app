// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCfrVggJ_gDTkoXs6v9fpiztkrezUgPDdQ',
    appId: '1:336118523897:web:18d5af1761d26c5ac77f28',
    messagingSenderId: '336118523897',
    projectId: 'project-00-59f7a',
    authDomain: 'project-00-59f7a.firebaseapp.com',
    storageBucket: 'project-00-59f7a.firebasestorage.app',
    measurementId: 'G-P4XR48Z6J0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6k15zGJD1eLoBBU_WldQENzYVOTIJ97Y',
    appId: '1:336118523897:android:71cfbfcfa5719da2c77f28',
    messagingSenderId: '336118523897',
    projectId: 'project-00-59f7a',
    storageBucket: 'project-00-59f7a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9G8wLmHqg04Buq2g6JTgCYEG2-yxxWXs',
    appId: '1:336118523897:ios:cbc821ffa62d9b98c77f28',
    messagingSenderId: '336118523897',
    projectId: 'project-00-59f7a',
    storageBucket: 'project-00-59f7a.firebasestorage.app',
    androidClientId:
        '336118523897-rktfoumf1krfuontrama695bdooo04s3.apps.googleusercontent.com',
    iosClientId:
        '336118523897-ghbn6qv2nokkljgng88lk11f7gcf2uhe.apps.googleusercontent.com',
    iosBundleId: 'com.example.scheduleManagment',
  );
}
