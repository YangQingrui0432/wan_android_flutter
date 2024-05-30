import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:wan_android_flutter/module/auth/repository/data/auth_data.dart';
import 'package:wan_android_flutter/module/hot_key/repository/data/common_website_data.dart';
import 'package:wan_android_flutter/module/hot_key/repository/data/hot_key_data.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_article_data.dart';
import 'package:wan_android_flutter/module/knowledge/repository/data/knowledge_data.dart';
import 'package:wan_android_flutter/module/home/repository/data/home_banner_data.dart';
import 'package:wan_android_flutter/module/home/repository/data/home_article_data.dart';
import 'package:wan_android_flutter/http/dio_instance.dart';

class Api {
  Future<List<HomeBannerItemData>?> getBanner() async {
    Response response = await DioInstance().get("/banner/json");
    return HomeBannerData.fromJson(response.data).list;
  }

  Future<List<HomeArticleItemData>?> getTopArticleList() async {
    Response response = await DioInstance().get("/article/top/json");
    return HomeTopArticleData.fromJson(response.data).list;
  }

  Future<List<HomeArticleItemData>?> getArticleList(String page) async {
    Response response = await DioInstance().get("/article/list/$page/json");
    return HomeArticleData.fromJson(response.data).datas;
  }

  Future<List<HotKeyItemData>?> getHotKeys() async {
    Response response = await DioInstance().get("/hotkey/json");
    return HotKeyData.fromJson(response.data).list;
  }

  Future<List<CommonWebsiteItemData>?> getCommonWebsites() async {
    Response response = await DioInstance().get("/friend/json");
    return CommonWebsiteData.fromJson(response.data).list;
  }

  Future<AuthData?> login(String userName, String password) async {
    Response response = await DioInstance().post("/user/login",
        queryParameters: {"username": userName, "password": password});
    try {
      return AuthData.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        log("login error = $e");
        return null;
      }
    }
  }

  Future<AuthData?> register(
      String userName, String password, String rePassword) async {
    Response response = await DioInstance().post("/user/register",
        queryParameters: {
          "username": userName,
          "password": password,
          "repassword": rePassword
        });
    try {
      return AuthData.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        log("login error = $e");
        return null;
      }
    }
  }

  Future<bool> logout() async {
    try {
      Response response = await DioInstance().get("/user/logout/json");
      return response.data;
    } catch (e) {
      return false;
    }
  }

  Future<List<KnowledgeListData>?> getKnowledge() async {
    Response response = await DioInstance().get("/tree/json");
    return KnowledgeData.fromJson(response.data).list;
  }

  Future<List<KnowledgeArticleItem>?> getKnowledgeArticles(int page, String cid) async {
    Response response = await DioInstance().get("/article/list/$page/json?cid=$cid");
    return KnowledgeArticleData.fromJson(response.data).datas;
  }
}
