import 'package:flutter/material.dart';
import 'package:wan_android_flutter/module/auth/repository/user_state.dart';
import 'package:wan_android_flutter/module/api.dart';

class PersonalViewModel with ChangeNotifier {
  String name = "";

  Future initData() async {
    name = await UserStateContext().username();
    notifyListeners();
  }

  Future logout() async {
    var res = await Api().logout();
    if (res) {
      await UserStateContext().logout();
      initData();
    }
  }
}
