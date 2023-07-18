import 'package:firebase_auth/firebase_auth.dart';

class SignOutRepository{
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}