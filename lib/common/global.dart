import 'package:flutter/material.dart';
import 'package:wan_android_flutter/http/dio_instance.dart';
import 'package:wan_android_flutter/module/auth/repository/user_state.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    DioInstance().init("https://www.wanandroid.com");
    await UserStateContext().init();
  }
}
