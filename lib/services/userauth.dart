

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last/provider/userprovider.dart';
import 'package:uuid/uuid.dart';
import '../model/usermodel.dart';

class Authorization{
  final FirebaseAuth _auth =  FirebaseAuth.instance;
  late  Userprovider userdata;
  late UserModel usermd;
  var uuid = Uuid();
  Future createuser() async{
    try{
      UserCredential userCredential = _auth.createUserWithEmailAndPassword(email: userdata.email, password: userdata.password) as UserCredential;
      /*usermd.userId = uuid.v1();
      FirebaseFirestore.instance.collection("User")
          .doc(usermd.userId)
          .set(usermd.toJson());*/
    }catch(e){
      print(e);
    }
  }
}