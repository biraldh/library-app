import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:last/Feature/Auth/Presentation/Pages/Sign_up_page.dart';
import 'package:last/Feature/Auth/Presentation/Widget/auth_gradient_button.dart';
import 'package:last/core/theme/app_pallet.dart';

import '../Widget/Authfield.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context)=> SignUpPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign In.", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              AuthField( Hinttext: 'Email',controller: emailcontroller,),
              const SizedBox(height: 15,),
              AuthField( Hinttext: 'Password',controller: passwordcontroller, isObsecureText: true,),
              const SizedBox(height: 20,),
              AuthsGradientButton(ButtonText: 'Sign in',
              onPressed: (){},),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(text: TextSpan(
                    text: 'Dont\'t have an Account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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
