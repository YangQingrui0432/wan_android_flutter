import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android_flutter/module/auth/repository/user_state.dart';
import 'package:wan_android_flutter/module/api.dart';

class AuthViewModel with ChangeNotifier {

  Future<bool> login(String? userName, String? password) async {
    if (_checkIllegal("login", userName: userName, password: password)) {
      return false;
    }

    try {
      var data = await Api().login(userName!, password!);
      var res = data != null;
      if (res) {
        await UserStateContext().login(data);
      }
      showToast(res ? "登录成功" : "登录失败");
      return res;
    } catch (e) {
      showToast("${(e as DioException).message}");
      return false;
    }
  }

  Future<bool> register(
      String? userName, String? password, String? rePassword) async {
    if (_checkIllegal("register",
        userName: userName, password: password, rePassword: rePassword)) {
      return false;
    }

    try {
      var data = await Api().register(userName!, password!, rePassword!);
      var res = data != null;
      if (res) {
        await UserStateContext().login(data);
      }
      showToast(res ? "注册成功" : "注册失败");
      return res;
    } catch (e) {
      showToast("${(e as DioException).message}");
      return false;
    }
  }

  bool _checkIllegal(String type,
      {required String? userName,
      required String? password,
      String? rePassword}) {
    if (userName == null || userName.isEmpty) {
      showToast("用户名不能为空");
      return true;
    }

    if (password == null || password.isEmpty) {
      showToast("密码不能为空");
      return true;
    }

    if (type == "register" &&
        (rePassword == null || rePassword.isEmpty || password != rePassword)) {
      showToast("密码必须保持一致");
      return true;
    }

    return false;
  }
}
