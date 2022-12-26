import 'package:flutter/material.dart';

import '../Models/userT_model.dart';

class ListUsersProvider extends ChangeNotifier {
  List<User>? listUsers;
  ListUsersProvider({Key? key}) : super();

  get getListUsers => listUsers;

  setUsers(List<User> listUsersP) {
    listUsers = listUsersP;
  }
}
