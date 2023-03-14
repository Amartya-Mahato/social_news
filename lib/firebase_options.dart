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
    apiKey: 'AIzaSyAHan62UVrysz_I1XCuYIrXQZT7Js-0_Ms',
    appId: '1:26923643376:web:96585c5ad2909da5de2d35',
    messagingSenderId: '26923643376',
    projectId: 'social-news-aa462',
    authDomain: 'social-news-aa462.firebaseapp.com',
    storageBucket: 'social-news-aa462.appspot.com',
    measurementId: 'G-C0K9VV6ZPT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxtBHgProX-QNxCoRcZ9IQwb3CeB32Tjs',
    appId: '1:26923643376:android:e4d336d11b288026de2d35',
    messagingSenderId: '26923643376',
    projectId: 'social-news-aa462',
    storageBucket: 'social-news-aa462.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-mpRMUyOgmA_VlJ_BxzgRV6YhcDD1koI',
    appId: '1:26923643376:ios:86d72e42d13d3616de2d35',
    messagingSenderId: '26923643376',
    projectId: 'social-news-aa462',
    storageBucket: 'social-news-aa462.appspot.com',
    iosClientId: '26923643376-i4gol8bmgsmusmoh4igku6qpvfn8mbvi.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialNews',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-mpRMUyOgmA_VlJ_BxzgRV6YhcDD1koI',
    appId: '1:26923643376:ios:86d72e42d13d3616de2d35',
    messagingSenderId: '26923643376',
    projectId: 'social-news-aa462',
    storageBucket: 'social-news-aa462.appspot.com',
    iosClientId: '26923643376-i4gol8bmgsmusmoh4igku6qpvfn8mbvi.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialNews',
  );
}