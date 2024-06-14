import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBAL3VCwAbkQCNzFZkdcCjciHg4eSueSWs",
            authDomain: "facelesskin-kz6dgv.firebaseapp.com",
            projectId: "facelesskin-kz6dgv",
            storageBucket: "facelesskin-kz6dgv.appspot.com",
            messagingSenderId: "951797573713",
            appId: "1:951797573713:web:0bd5fcc694442144513070"));
  } else {
    await Firebase.initializeApp();
  }
}
