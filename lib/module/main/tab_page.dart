import 'package:flutter/material.dart';
import 'package:wan_android_flutter/common_ui/navigation/navigation_bar_widget.dart';
import 'package:wan_android_flutter/module/home/home_page.dart';
import 'package:wan_android_flutter/module/hot_key/hot_key_page.dart';
import 'package:wan_android_flutter/module/knowledge/knowledge_page.dart';
import 'package:wan_android_flutter/module/personal/personal_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  late final List<Widget> pages;

  late final List<String> labels;

  late final List<Widget> icons;

  late final List<Widget> activeIcons;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initPages();
  }

  void initPages() {
    pages = [
      const HomePage(),
      const HotKeyPage(),
      const KnowledgePage(),
      const PersonalPage()
    ];
    labels = ["首页", "热点", "体系", "我的"];
    icons = [
      const Icon(
        Icons.home_outlined,
        size: 30,
        color: Colors.grey,
      ),
      const Icon(
        Icons.notifications_outlined,
        size: 30,
        color: Colors.grey,
      ),
      const Icon(
        Icons.school_outlined,
        size: 30,
        color: Colors.grey,
      ),
      const Icon(
        Icons.person_outline,
        size: 30,
        color: Colors.grey,
      )
    ];
    activeIcons = [
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.deepPurple,
      ),
      const Icon(
        Icons.notifications,
        size: 30,
        color: Colors.deepPurple,
      ),
      const Icon(
        Icons.school,
        size: 30,
        color: Colors.deepPurple,
      ),
      const Icon(
        Icons.person,
        size: 30,
        color: Colors.deepPurple,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWidget(
      pages: pages,
      labels: labels,
      icons: icons,
      activeIcons: activeIcons,
      currentIndex: 0,
      onPageChanged: (index) {},
    );
  }
}
