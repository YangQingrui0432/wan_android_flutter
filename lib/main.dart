import 'package:flutter/material.dart';
import 'package:wan_android_flutter/common/Global.dart';

import 'app.dart';

void main() {
  Global.init().then((value) => runApp(const MyApp()));
}
