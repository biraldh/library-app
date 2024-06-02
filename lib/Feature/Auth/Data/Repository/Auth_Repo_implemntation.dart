import 'package:fpdart/src/either.dart';
import 'package:last/Feature/Auth/Data/datasource/authDataSource.dart';
import 'package:last/Feature/Auth/Domain/Repository/auth_repository.dart';
import 'package:last/core/error/exception.dart';
import 'package:last/core/error/faliure.dart';

class AuthRepoImplemntation implements AuthRepository{
  final AuthDataSource authDataSource;
  const AuthRepoImplemntation(this.authDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailandPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailandPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailandPassword({
    required String name,
    required String email,
    required String password
  }) async {
    try {
      final uid = await authDataSource.signUpwithEmailandPassword(
          name: name,
          email: email,
          password: password);
      return right(uid);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}