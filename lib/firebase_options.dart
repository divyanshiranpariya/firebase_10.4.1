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
    apiKey: 'AIzaSyAuh3RLUpt7m24QThvMUBRC4UJAOsXH0wI',
    appId: '1:935912942052:web:8ec0b050a13db197e17ff1',
    messagingSenderId: '935912942052',
    projectId: 'fir-3-d025e',
    authDomain: 'fir-3-d025e.firebaseapp.com',
    storageBucket: 'fir-3-d025e.appspot.com',
    measurementId: 'G-Q98JNW5R2N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCd7WatGydZXmAMm5E6VwguCceVfP_QDyo',
    appId: '1:935912942052:android:aca8d3829c276e78e17ff1',
    messagingSenderId: '935912942052',
    projectId: 'fir-3-d025e',
    storageBucket: 'fir-3-d025e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdv9arm15gPu4vX6Bv4Cgdv9IdWZyrLJs',
    appId: '1:935912942052:ios:e64b8081303b403be17ff1',
    messagingSenderId: '935912942052',
    projectId: 'fir-3-d025e',
    storageBucket: 'fir-3-d025e.appspot.com',
    iosBundleId: 'com.example.firebase3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdv9arm15gPu4vX6Bv4Cgdv9IdWZyrLJs',
    appId: '1:935912942052:ios:e64b8081303b403be17ff1',
    messagingSenderId: '935912942052',
    projectId: 'fir-3-d025e',
    storageBucket: 'fir-3-d025e.appspot.com',
    iosBundleId: 'com.example.firebase3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAuh3RLUpt7m24QThvMUBRC4UJAOsXH0wI',
    appId: '1:935912942052:web:a3285a8f498e940fe17ff1',
    messagingSenderId: '935912942052',
    projectId: 'fir-3-d025e',
    authDomain: 'fir-3-d025e.firebaseapp.com',
    storageBucket: 'fir-3-d025e.appspot.com',
    measurementId: 'G-CMPVZ9W6LR',
  );
}