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
    apiKey: 'AIzaSyDNVIdoMHB13XhJbOmlVG6kaYqJr-6HL3c',
    appId: '1:964926435796:web:8d14b71bf3cbd34c362641',
    messagingSenderId: '964926435796',
    projectId: 'listaresponse',
    authDomain: 'listaresponse.firebaseapp.com',
    storageBucket: 'listaresponse.appspot.com',
    measurementId: 'G-EQ477L5K6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsmm6674a507iKCoTmCpYnfgkL8kIzhkw',
    appId: '1:964926435796:android:fcd32e9d39644934362641',
    messagingSenderId: '964926435796',
    projectId: 'listaresponse',
    storageBucket: 'listaresponse.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHEkkCPXIqSR5sIsgT4m9LUgi6_JAzPfI',
    appId: '1:964926435796:ios:e3724367be15f63b362641',
    messagingSenderId: '964926435796',
    projectId: 'listaresponse',
    storageBucket: 'listaresponse.appspot.com',
    iosClientId: '964926435796-ntokgvcrf2udqv62hltc613so4gbhlm0.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHEkkCPXIqSR5sIsgT4m9LUgi6_JAzPfI',
    appId: '1:964926435796:ios:e3724367be15f63b362641',
    messagingSenderId: '964926435796',
    projectId: 'listaresponse',
    storageBucket: 'listaresponse.appspot.com',
    iosClientId: '964926435796-ntokgvcrf2udqv62hltc613so4gbhlm0.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDatabase',
  );
}
