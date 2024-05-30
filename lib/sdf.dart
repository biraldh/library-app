import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last/test.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  SignIn si = SignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: InkWell(
            onTap: (){
              si.signInWithEmailAndPassword();
            },
            child: Text("asf"),
          ),
        ),
      ),
    );
  }
}
