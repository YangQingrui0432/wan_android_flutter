import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/module/auth/repository/user_state.dart';
import 'package:wan_android_flutter/module/personal/personal_vm.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PersonalPageState();
  }
}

class _PersonalPageState extends State<PersonalPage> {
  PersonalViewModel viewModel = PersonalViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PersonalViewModel>(
        create: (context) => viewModel,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _header(() {
                  UserStateContext().clickProfile(context);
                }),
                _item(text: "我的收藏", onTap: () {}),
                _item(text: "检查更新", onTap: () {}),
                _item(text: "关于我们", onTap: () {}),
                Consumer<PersonalViewModel>(builder: (context, vm, child) {
                  if (UserStateContext().isLogin()) {
                    return _item(
                        text: "退出登录",
                        onTap: () {
                          vm.logout();
                        });
                  } else {
                    return const SizedBox();
                  }
                }),
              ],
            ),
          ),
        ));
  }

  Widget _header(GestureTapCallback? onTap) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              child: Icon(
                Icons.account_circle_rounded,
                size: 70,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Consumer<PersonalViewModel>(builder: (context, vm, child) {
            return GestureDetector(
              onTap: onTap,
              child: Text(
                vm.name,
                style: const TextStyle(color: Colors.white),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget _item({required String text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
