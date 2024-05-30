import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
  Future signInWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'mist@gmail.com',
        password: '123456hgl789',
      );
      print('User signed in: ${credential.user!.uid}');
      // You can perform further actions after successful sign-in here
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
