import 'package:flutter/material.dart';
import 'package:wan_android_flutter/constants.dart';
import 'package:wan_android_flutter/module/auth/repository/data/auth_data.dart';
import 'package:wan_android_flutter/utils/sp_utils.dart';
import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';

class UserStateContext extends UserState {
  static final UserStateContext _instance = UserStateContext._internal();

  UserStateContext._internal();

  factory UserStateContext() {
    return _instance;
  }

  UserState state = LogoutState();

  Future init() async {
    if (await SPUtils.getBool(Constants.KEY_LOGIN_STATE) ?? false) {
      state = LoginState();
    } else {
      state = LogoutState();
    }
  }

  bool isLogin() {
    return state is LoginState;
  }

  Future login(AuthData? data) async {
    state = LoginState(data: data);
    await apply();
  }

  Future logout() async {
    state = LogoutState();
    await apply();
  }

  @override
  Future apply() async {
    return await state.apply();
  }

  @override
  void clickProfile(BuildContext context) {
    state.clickProfile(context);
  }

  @override
  Future<String> username() async {
    return await state.username();
  }
}

abstract class UserState {
  Future apply();

  Future<String> username();

  void clickProfile(BuildContext context);
}

class LoginState extends UserState {
  AuthData? data;
  String? _username;

  LoginState({this.data});

  @override
  Future apply() async {
    _username = data?.username;
    await SPUtils.saveBool(Constants.KEY_LOGIN_STATE, true);
    await SPUtils.saveString(Constants.KEY_USER_NAME, _username ?? "无名");
  }

  @override
  Future<String> username() async {
    return _username ??=
        await SPUtils.getString(Constants.KEY_USER_NAME) ?? "无名";
  }

  @override
  void clickProfile(BuildContext context) {}
}

class LogoutState extends UserState {
  @override
  Future apply() async {
    await SPUtils.saveBool(Constants.KEY_LOGIN_STATE, false);
    await SPUtils.remove(Constants.KEY_USER_NAME);
  }

  @override
  Future<String> username() async {
    return "未登录";
  }

  @override
  void clickProfile(BuildContext context) {
    RouteUtils.pushForNamed(context, RoutePath.loginPage);
  }
}
