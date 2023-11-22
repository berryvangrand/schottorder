import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCW_eEytpYtRXnxuHHjL4ms0JYeL0gs45s",
            authDomain: "schott-order-mppor2.firebaseapp.com",
            projectId: "schott-order-mppor2",
            storageBucket: "schott-order-mppor2.appspot.com",
            messagingSenderId: "562703909549",
            appId: "1:562703909549:web:4fc78bdd9fe8d007813c24"));
  } else {
    await Firebase.initializeApp();
  }
}
