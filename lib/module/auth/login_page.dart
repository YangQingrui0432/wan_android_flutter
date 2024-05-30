import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/module/auth/auth_vm.dart';
import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';
import 'package:wan_android_flutter/common_ui/common_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              title: const Text("登录"),
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<AuthViewModel>(builder: (context, vm, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      input(labelText: "用户名", controller: userNameController),
                      const SizedBox(
                        height: 20,
                      ),
                      input(
                          labelText: "密码",
                          obscureText: true,
                          controller: passwordController),
                      const SizedBox(
                        height: 50,
                      ),
                      button(
                          text: "登录",
                          onTap: () {
                            vm
                                .login(userNameController.value.text,
                                    passwordController.value.text)
                                .then((value) {
                              if (value) {
                                RouteUtils.pushNamedAndRemoveUntil(
                                    context, RoutePath.tabPage);
                              }
                            });
                          }),
                      const SizedBox(
                        height: 6,
                      ),
                      _registerButton(onTap: () {
                        RouteUtils.pushForNamed(
                            context, RoutePath.registerPage);
                      }),
                    ],
                  );
                }),
              ),
            ),
          ),
        ));
  }

  Widget _registerButton({GestureTapCallback? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            "注册",
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
