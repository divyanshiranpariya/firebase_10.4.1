import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Views/screens/home_page.dart';
import 'Views/screens/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'LoginPage',
    routes: {
      '/': (context) => HomePage(),
      'LoginPage': (context) => LoginPage(),
    },
  ));
}
