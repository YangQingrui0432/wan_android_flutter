import 'package:flutter/material.dart';
import 'package:wan_android_flutter/module/api.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_article_data.dart';

class KnowledgeDetailChildViewModel with ChangeNotifier {

  int page = 0;

  List<KnowledgeArticleItem> knowledgeArticles = [];

  Future getKnowledgeArticleData(String cid, bool loadMore) async {
    if (loadMore) {
      page++;
    } else {
      page = 0;
      knowledgeArticles.clear();
    }

    List<KnowledgeArticleItem>? list = await Api().getKnowledgeArticles(page, cid);
    if (list != null && list.isNotEmpty) {
      knowledgeArticles.addAll(list);
      notifyListeners();
    }
  }
}