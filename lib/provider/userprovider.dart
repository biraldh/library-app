import 'package:flutter/cupertino.dart';

class Userprovider extends ChangeNotifier{
  String _name = '';
  String get name => _name;

  String _password = '';
  String get password => _password;

  String _email = '';
  String get email => _email;

  set name(String Newname){
    _name = Newname;
    notifyListeners();
  }
  set password(String Newpassword){
    _password = Newpassword;
    notifyListeners();
  }

  set email(String Newemail){
    _email = Newemail;
    notifyListeners();

  }
}