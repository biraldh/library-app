import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/Feature/Auth/Presentation/Pages/Login_page.dart';
import 'package:last/Feature/Auth/Presentation/Widget/auth_gradient_button.dart';
import 'package:last/Feature/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:last/core/theme/app_pallet.dart';

import '../Widget/Authfield.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context)=> LoginPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign Up.", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              AuthField( Hinttext: 'Name', controller: namecontroller,),
              const SizedBox(height: 15,),
              AuthField( Hinttext: 'Email',controller: emailcontroller,),
              const SizedBox(height: 15,),
              AuthField( Hinttext: 'Password',controller: passwordcontroller, isObsecureText: true,),
              const SizedBox(height: 20,),
              AuthsGradientButton(ButtonText: 'Sign Up',
              onPressed: (){
                if(formkey.currentState!.validate()){
                  context.read<AuthBloc>().add(AuthSignUp(
                      name: namecontroller.text.trim(),
                      email: emailcontroller.text.trim(),
                      password: passwordcontroller.text.trim()

                  )
                  );
                }else {
                print('Form is not valid. Cannot send data to AuthBloc.');}
              },),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(text: TextSpan(
                  text: 'Already have an Account? ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
