import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/common_ui/smart_refresh/smart_refresh_widget.dart';
import 'package:wan_android_flutter/module/knowledge/knowledge_detail_child_vm.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_article_data.dart';

import 'package:wan_android_flutter/common_ui/common_style.dart';

import 'package:wan_android_flutter/route/route_utils.dart';
import 'package:wan_android_flutter/route/routes.dart';

class KnowledgeDetailChildPage extends StatefulWidget {
  final String cid;

  const KnowledgeDetailChildPage({super.key, required this.cid});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeDetailChildPageState();
  }
}

class _KnowledgeDetailChildPageState extends State<KnowledgeDetailChildPage> {
  KnowledgeDetailChildViewModel viewModel = KnowledgeDetailChildViewModel();

  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();

    viewModel.getKnowledgeArticleData(widget.cid ?? "", false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KnowledgeDetailChildViewModel>(
        create: (context) => viewModel,
        child: Scaffold(
          body: SmartRefreshWidget(
            controller: refreshController,
            child: _listView(),
          ),
        ));
  }

  Widget _listView() {
    return Consumer<KnowledgeDetailChildViewModel>(
        builder: (context, vm, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return _listViewItem(vm.knowledgeArticles[index]);
          },
          itemCount: vm.knowledgeArticles.length);
    });
  }

  Widget _listViewItem(KnowledgeArticleItem data) {
    String? author;
    if (data.author?.isNotEmpty == true) {
      author = data.author;
    } else {
      author = data.shareUser;
    }

    String chapter =
        "${data.superChapterName ?? ""} / ${data.chapterName ?? ""}";
    if (chapter.isNotEmpty == true && chapter.endsWith(" / ")) {
      chapter.replaceRange(chapter.length - 2, null, "");
    }

    return articleListItem(
      type: data.type ?? 0,
      collect: data.collect ?? false,
      title: data.title,
      chapter: chapter,
      dateText: data.niceDate,
      author: author,
      onTap: () {
        RouteUtils.pushForNamed(context, RoutePath.webViewPage,
            arguments: {"name": data.title ?? ""});
      },
    );
  }
}
