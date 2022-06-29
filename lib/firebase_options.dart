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
    apiKey: 'AIzaSyAD408EIr1USYQZpOa0xKLrrqA6gZMr9Uk',
    appId: '1:97172309057:web:f5a00408d298babe6372c0',
    messagingSenderId: '97172309057',
    projectId: 'kebab-katowice',
    authDomain: 'kebab-katowice.firebaseapp.com',
    storageBucket: 'kebab-katowice.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdR1kh1ExwLw_ylOErEb2tuoE1iwJNlwM',
    appId: '1:97172309057:android:0b4c8704752d547e6372c0',
    messagingSenderId: '97172309057',
    projectId: 'kebab-katowice',
    storageBucket: 'kebab-katowice.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1iotCM60IC5gr7Arx_N1ahLko9xXju7o',
    appId: '1:97172309057:ios:4843bf8568c420af6372c0',
    messagingSenderId: '97172309057',
    projectId: 'kebab-katowice',
    storageBucket: 'kebab-katowice.appspot.com',
    iosClientId: '97172309057-tmmlbkqcihl5mbc43r9ho0g4igfl3skd.apps.googleusercontent.com',
    iosBundleId: 'com.sebastianpilch.kebabKatowice',
  );
}
