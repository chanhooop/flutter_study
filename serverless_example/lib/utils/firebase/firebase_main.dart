import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:serverless_example/firebase_options.dart';

class FirebaseMain {
  // firebase
  firebaseInitializeApp() async{
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

}