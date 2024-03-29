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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANLQ947dxKiasNqUwu_2mqaySdCGoGGBs',
    appId: '1:1711414176:android:d694c6fd35e22a0b61a2c5',
    messagingSenderId: '1711414176',
    projectId: 'cartfid-821b6',
    storageBucket: 'cartfid-821b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyXHdXctzvlegbV7wAyDpnKSLR1296Uf0',
    appId: '1:1711414176:ios:4a775395b93e94e561a2c5',
    messagingSenderId: '1711414176',
    projectId: 'cartfid-821b6',
    storageBucket: 'cartfid-821b6.appspot.com',
    iosClientId: '1711414176-9gq5s9v0ffee0m7g5g1g4fb94uc9nkql.apps.googleusercontent.com',
    iosBundleId: 'n',
  );
}
