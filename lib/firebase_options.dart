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
    apiKey: 'AIzaSyCP6pk66UQbrg3l6UJGUY0PQkJ80kmJ1q4',
    appId: '1:736993234483:web:2cb20a776185cfa0eadd46',
    messagingSenderId: '736993234483',
    projectId: 'sustainswap-9ced0',
    authDomain: 'sustainswap-9ced0.firebaseapp.com',
    storageBucket: 'sustainswap-9ced0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3D_s5gVxjU-mCBHvPr8LyuP1wfgJ7Zc0',
    appId: '1:736993234483:android:9a89016c9e38ee5eeadd46',
    messagingSenderId: '736993234483',
    projectId: 'sustainswap-9ced0',
    storageBucket: 'sustainswap-9ced0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBobwaebYRtEiSSQygnwv9HQCrR2YCtvEA',
    appId: '1:736993234483:ios:e49da2eb5d441569eadd46',
    messagingSenderId: '736993234483',
    projectId: 'sustainswap-9ced0',
    storageBucket: 'sustainswap-9ced0.appspot.com',
    iosClientId: '736993234483-u0q7e0vlr3dr5lo4lr23s84qd2ksuu8g.apps.googleusercontent.com',
    iosBundleId: 'com.example.newApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBobwaebYRtEiSSQygnwv9HQCrR2YCtvEA',
    appId: '1:736993234483:ios:70cde2a23f68529feadd46',
    messagingSenderId: '736993234483',
    projectId: 'sustainswap-9ced0',
    storageBucket: 'sustainswap-9ced0.appspot.com',
    iosClientId: '736993234483-kk19j4sss5bl9r4187n7kgr93su8le94.apps.googleusercontent.com',
    iosBundleId: 'com.example.newApp.RunnerTests',
  );
}