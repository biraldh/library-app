import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last/provider/userprovider.dart';
import 'package:provider/provider.dart';

import '../services/userauth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<Userprovider>(context);
    double width = MediaQuery.of(context).size.width;
    Authorization _auth = Authorization();
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Library of words", style: TextStyle(
            fontSize: 50,
          ),),
          Center(
            child: SizedBox(
                width: width/2,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                  ),
                  onSubmitted: (value){
                    providerUser.email = value;
                  },
                ),
              ),
          ),
          SizedBox(
            width: width/2,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
              onSubmitted: (value){
                providerUser.name = value;
              },
            ),
          ),
          SizedBox(
            width: width/2,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
              onSubmitted: (value){
                providerUser.password = value;
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              minimumSize: Size(width/3, 40),
            ) ,
            onPressed: (){
              _auth.createuser();
              print(providerUser.email);
              print(providerUser.name);
              print(providerUser.password);
            },
            child: Text("Login")),
        ],
      ),
    );
  }
}
