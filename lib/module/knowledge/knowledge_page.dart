import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/module/knowledge/knowledge_vm.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_data.dart';
import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgePageState();
  }
}

class _KnowledgePageState extends State<KnowledgePage> {
  KnowledgeViewModel viewModel = KnowledgeViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.getKnowledgeData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KnowledgeViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Consumer<KnowledgeViewModel>(
            builder: (context, vm, child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var list = vm.list?[index];
                  return _listViewItem(index,
                      title: list?.name,
                      desc: vm.getKnowledgeDesc(list?.children), onTap: () {
                    RouteUtils.pushForNamed(
                        context, RoutePath.knowledgeDetailPage, arguments: {
                      "title": list?.name,
                      "items": list?.children
                    });
                  });
                },
                itemCount: vm.list?.length ?? 0,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _listViewItem(int index,
      {String? title, String? desc, GestureTapCallback? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
              left: 20, top: index == 0 ? 20 : 0, right: 20, bottom: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.8),
              borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      desc ?? "",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
                size: 20,
              )
            ],
          ),
        ));
  }
}
