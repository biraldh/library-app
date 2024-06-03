import'package:firebase_auth/firebase_auth.dart';
import 'package:last/core/error/exception.dart';

abstract interface class AuthDataSource{
  Future<String> signUpwithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> signInwithEmailandPassword({
    required String email,
    required String password,
  });
}
class AuthdatasourceImpelentation implements AuthDataSource{
  final FirebaseAuth _auth;

  AuthdatasourceImpelentation(this._auth);

  @override
  Future<String> signInwithEmailandPassword({
    required String email,
    required String password
  })
  {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpwithEmailandPassword({
    required String name,
    required String email,
    required String password
  })
  async{
    try{
      UserCredential usercredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(usercredential.user == null){
        throw ServerException('User in null');
      }
      return usercredential.user!.uid;
    }catch(e){
      throw ServerException(e.toString());
    }
  }
  
}