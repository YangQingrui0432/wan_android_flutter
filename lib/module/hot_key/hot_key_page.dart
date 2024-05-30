
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/module/hot_key/hot_key_vm.dart';
import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HotKeyPageState();
  }
}

class _HotKeyPageState extends State<HotKeyPage> {
  HotKeyViewModel viewModel = HotKeyViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotKeyViewModel>(
        create: (context) {
          return viewModel;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.2, color: Colors.grey))),
                    child: const Row(children: [
                      Text(
                        "搜索热词",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.search,
                        size: 25,
                      )
                    ]),
                  ),
                  Consumer<HotKeyViewModel>(builder: (context, vm, child) {
                    return _gridView(
                        itemText: (index) => vm.hotKeys?[index].name ?? "",
                        itemCount: vm.hotKeys?.length ?? 0,
                        onItemTap: (index) {});
                  }),
                  Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      "常用网站",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Consumer<HotKeyViewModel>(builder: (context, vm, child) {
                    return _gridView(
                        itemText: (index) =>
                            vm.commonWebsites?[index].name ?? "",
                        itemCount: vm.commonWebsites?.length ?? 0,
                        onItemTap: (index) {
                          RouteUtils.pushForNamed(
                              context, RoutePath.webViewPage, arguments: {
                            "name": vm.commonWebsites?[index].name ?? ""
                          });
                        });
                  }),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _gridView(
      {ItemText? itemText, int? itemCount, ValueChanged<int>? onItemTap}) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 120),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                onItemTap?.call(index);
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                  alignment: Alignment.center,
                  child: Text(
                    itemText?.call(index) ?? "",
                    style: const TextStyle(fontSize: 12),
                  )));
        },
        itemCount: itemCount ?? 0);
  }
}

typedef ItemText = String Function(int index);
