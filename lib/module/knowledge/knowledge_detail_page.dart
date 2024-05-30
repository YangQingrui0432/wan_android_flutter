import 'package:flutter/material.dart';
import 'package:wan_android_flutter/module/knowledge/knowledge_detail_child_page.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_data.dart';
import 'package:wan_android_flutter/route/route_args_mixin.dart';

class KnowledgeDetailPage extends StatefulWidget with RouteArgsMixin {
  KnowledgeDetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeDetailPageState();
  }
}

class _KnowledgeDetailPageState extends State<KnowledgeDetailPage>
    with TickerProviderStateMixin {
  late String title;
  List<KnowledgeListItem>? items = [];

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    final args = widget.arguments;
    if (args is Map) {
      title = args["title"] ?? "体系知识";
      items = args["items"];
    }

    tabController = TabController(length: items?.length ?? 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: items?.length ?? 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            title: Text(title),
            bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 1,
              dividerColor: Colors.transparent,
              tabs: _tabs(),
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: _tabPages(),
            ),
          ),
        ));
  }

  List<Widget> _tabs() {
    return items?.map((item) => Tab(text: "${item.name}")).toList() ?? [];
  }

  List<Widget> _tabPages() {
    return items
            ?.map((e) => KnowledgeDetailChildPage(cid: "${e.id}"))
            .toList() ??
        [];
  }
}
