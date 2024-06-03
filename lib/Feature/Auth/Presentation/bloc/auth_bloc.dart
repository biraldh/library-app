import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/Feature/Auth/Domain/UseCase/user_sign_up.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp
  }) : _userSignUp = userSignUp, super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async{
      final res = await _userSignUp(UserSignUpParams(name: event.name,
          email: event.email,
          password: event.password));
      res.fold((faliure) => emit(AuthFaliure(faliure.message)) ,
              (uid) => emit(AuthSuccess(uid)));
    });
  }
}
