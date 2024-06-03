import 'dart:math';

import 'package:fpdart/src/either.dart';
import 'package:last/Feature/Auth/Domain/Repository/auth_repository.dart';
import 'package:last/core/Use_case/usecase.dart';
import 'package:last/core/error/faliure.dart';

class UserSignUp implements UseCase<String, UserSignUpParams>{
  final AuthRepository authrepo;
  const UserSignUp(this.authrepo);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async{
    return await authrepo.signUpWithEmailandPassword(name: params.name,
        email: params.email,
        password: params.password
    );
  }
  
}

class UserSignUpParams{
  final String name;
  final String email;
  final String password;
  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}