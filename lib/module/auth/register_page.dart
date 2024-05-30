import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';

import 'package:wan_android_flutter/common_ui/common_style.dart';
import 'auth_vm.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  AuthViewModel viewModel = AuthViewModel();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
        create: (context) => AuthViewModel(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("注册"),
            ),
            body: SafeArea(
              child: Consumer<AuthViewModel>(builder: (context, vm, child) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      input(labelText: "用户名", controller: userNameController),
                      const SizedBox(
                        height: 20,
                      ),
                      input(
                          labelText: "密码",
                          controller: passwordController,
                          obscureText: true),
                      const SizedBox(
                        height: 20,
                      ),
                      input(
                          labelText: "确认密码",
                          controller: rePasswordController,
                          obscureText: true),
                      const SizedBox(
                        height: 50,
                      ),
                      button(
                          text: "注册",
                          onTap: () {
                            vm
                                .register(
                                    userNameController.value.text,
                                    passwordController.value.text,
                                    rePasswordController.value.text)
                                .then((value) {
                              if (value) {
                                RouteUtils.pushNamedAndRemoveUntil(
                                    context, RoutePath.tabPage,
                                    predicate: (Route<dynamic> route) => false);
                              }
                            });
                          }),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
