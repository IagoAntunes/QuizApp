import 'package:flutter/material.dart';

import '../Models/userT_model.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  UserProvider({Key? key}) : super();

  get getUser => user;

  setUser(User userP) {
    user = userP;
  }
}
