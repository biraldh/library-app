import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last/core/theme/app_pallet.dart';

class AuthsGradientButton extends StatelessWidget {
  final String ButtonText;
  final  VoidCallback onPressed;
  const AuthsGradientButton({super.key, required this.ButtonText,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppPallete.gradient1,
          AppPallete.gradient2,
        ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
        borderRadius: BorderRadius.circular(7)
      ),
      child: ElevatedButton(

        onPressed: (){
          print('Button pressed!');
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
          fixedSize: const Size(395, 55),
        ),
        child: Text (ButtonText, style: TextStyle(fontSize: 17,
            fontWeight: FontWeight.w600),),
      ),
    );

  }
}
