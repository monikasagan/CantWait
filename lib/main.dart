import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
=======
import 'package:gansa/presentation/pages/auth/login/login_page.dart';
>>>>>>> d6ab9619efb94bd21bb0660f39b291283a18905a
import 'firebase_options.dart';
import 'presentation/pages/auth/auth_page/auth_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const AuthPage(),
    );
  }
}
