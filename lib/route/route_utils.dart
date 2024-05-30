import 'package:flutter/material.dart';
import 'package:wan_android_flutter/route/routes.dart';

class RouteUtils {
  static Future pushForNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future pushNamedAndRemoveUntil<T extends Object?>(
    BuildContext context,
    String newRouteName, {
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    predicate ??=
        (Route<dynamic> route) => ModalRoute.of(context)?.isCurrent ?? false;

    return Navigator.pushNamedAndRemoveUntil(context, newRouteName, predicate,
        arguments: arguments);
  }

  static Future push(BuildContext context, Widget widget) {
    return Navigator.push(context, Routes.pageRoute(widget));
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }
}
