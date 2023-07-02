import 'package:flutter/material.dart';
import 'package:gansa/presentation/pages/auth/login/login_page.dart';
import 'package:gansa/presentation/pages/auth/register/register_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<RootPage> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: tooglePages);
    } else {
      return RegisterPage(
        onTap: tooglePages,
      );
    }
  }
}
