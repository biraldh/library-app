import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/Feature/Auth/Data/Repository/Auth_Repo_implemntation.dart';
import 'package:last/Feature/Auth/Data/datasource/authDataSource.dart';
import 'package:last/Feature/Auth/Domain/UseCase/user_sign_up.dart';
import 'package:last/Feature/Auth/Presentation/Pages/Login_page.dart';
import 'package:last/Feature/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:last/core/theme/theme.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAus_Q4T7eEz82domPyO86omWSIDkJeeWQ',
        appId: '1:39402262874:android:5cbf4926b671e1401d2363',
        messagingSenderId: '1:39402262874:android:5cbf4926b671e1401d2363',
        projectId: 'bookonline-1be93',
        storageBucket: 'bookonline-1be93.appspot.com',
      )
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) =>
        AuthBloc(
          userSignUp: UserSignUp(
            AuthRepoImplemntation(
                AuthdatasourceImpelentation(
                    FirebaseAuth.instance
                )
            )
          )
        )
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.DarkModeTheme, debugShowCheckedModeBanner: false,
      home:LoginPage()
    );
  }
}


