import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../Models/User_model.dart';

class UserParseProvider extends ChangeNotifier {
  ParseUser? userParse;
  UserParseProvider({Key? key}) : super();

  get getUserParse => userParse;

  setUserParse(ParseUser userP) {
    userParse = userP;
  }
}
