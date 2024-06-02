import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String Hinttext;
  final TextEditingController controller;
  final bool isObsecureText;
  const AuthField({super.key,
    required this.Hinttext,
    required this.controller,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: Hinttext
      ),
      validator: (value){
        if(value!.isEmpty){
          return '$Hinttext is missing';
        }else{
          return null;
        }
      },
      obscureText: isObsecureText,
    );
  }
}
