import 'package:flutter/material.dart';

import 'package:wan_android_flutter/module/auth/login_page.dart';
import 'package:wan_android_flutter/module/auth/register_page.dart';
import 'package:wan_android_flutter/module//main/tab_page.dart';
import 'package:wan_android_flutter/module/knowledge/knowledge_detail_page.dart';
import 'package:wan_android_flutter/route/route_args_mixin.dart';
import 'package:wan_android_flutter/web/web_view_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tabPage:
        return pageRoute(const TabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(const WebViewPage(), settings: settings);
      case RoutePath.loginPage:
        return pageRoute(const LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(const RegisterPage(), settings: settings);
      case RoutePath.knowledgeDetailPage:
        return pageRoute(KnowledgeDetailPage(), settings: settings);
    }

    return pageRoute(Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("路由：${settings.name} 不存在"),
        ),
      ),
    ));
  }

  static MaterialPageRoute pageRoute(
    Widget widget, {
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
        builder: (context) {
          if (widget is RouteArgsMixin) {
            (widget as RouteArgsMixin).arguments = settings?.arguments;
          }
          return widget;
        },
        settings: settings,
        maintainState: maintainState ?? true,
        fullscreenDialog: fullscreenDialog ?? false,
        allowSnapshotting: allowSnapshotting ?? true);
  }
}

class RoutePath {
  static const String tabPage = "/";

  static const String webViewPage = "/web_view_page";

  static const String loginPage = "/login_page";

  static const String registerPage = "/register_page";

  static const String knowledgeDetailPage = "/knowledge_detail_page";
}
