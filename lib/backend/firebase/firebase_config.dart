import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB2oyohgx_tyx0O5QbOIkFa_Q9rizmCPP8",
            authDomain: "h-h-h-the-ride-app-8hkscw.firebaseapp.com",
            projectId: "h-h-h-the-ride-app-8hkscw",
            storageBucket: "h-h-h-the-ride-app-8hkscw.firebasestorage.app",
            messagingSenderId: "713086161262",
            appId: "1:713086161262:web:dead55c6e94572dcf7b17f"));
  } else {
    await Firebase.initializeApp();
  }
}
