import 'package:flutter/material.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_data.dart';
import 'package:wan_android_flutter/module/api.dart';

class KnowledgeViewModel with ChangeNotifier {
  List<KnowledgeListData>? list;

  Future getKnowledgeData() async {
    list = await Api().getKnowledge();
    notifyListeners();
  }

  String getKnowledgeDesc(List<KnowledgeListItem>? list) {
    if (list == null || list.isEmpty) {
      return "";
    }

    StringBuffer buffer = StringBuffer();
    for (var item in list) {
      buffer.write(item.name);
      buffer.write(" ");
    }
    return buffer.toString();
  }

}
