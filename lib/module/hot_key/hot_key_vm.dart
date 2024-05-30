import 'package:flutter/material.dart';
import 'package:wan_android_flutter/module/api.dart';
import 'package:wan_android_flutter/module/hot_key/repository/data/common_website_data.dart';
import 'package:wan_android_flutter/module/hot_key/repository/data/hot_key_data.dart';

class HotKeyViewModel with ChangeNotifier {

  List<HotKeyItemData>? hotKeys;
  List<CommonWebsiteItemData>? commonWebsites;

  Future getData() async {
    hotKeys = await Api().getHotKeys();
    commonWebsites = await Api().getCommonWebsites();
    notifyListeners();
  }
}