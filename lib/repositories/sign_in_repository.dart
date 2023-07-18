import 'package:firebase_auth/firebase_auth.dart';

class SignInRepository {
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }


  
}
