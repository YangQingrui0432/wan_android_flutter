import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:wan_android_flutter/module/api.dart';
import 'package:wan_android_flutter/module/home/repository/data/home_article_data.dart';
import 'package:wan_android_flutter/module/home/repository/data/home_banner_data.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerItemData>? bannerList;
  List<HomeArticleItemData> articleList = [];

  int page = 0;

  Future getBanner() async {
    bannerList = await Api().getBanner() ?? [];
    notifyListeners();
  }

  Future getAllArticleList(bool loadMore,
      {ValueChanged<bool>? callback}) async {
    if (loadMore) {
      page++;
    } else {
      page = 0;

      var topList = await Api().getTopArticleList() ?? [];

      articleList.clear();
      articleList.addAll(topList);
    }

    var list = await Api().getArticleList("$page") ?? [];
    articleList.addAll(list);

    notifyListeners();

    callback?.call(loadMore);
  }
}
