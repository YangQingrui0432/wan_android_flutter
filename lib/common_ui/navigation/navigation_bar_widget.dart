import 'package:flutter/material.dart';
import 'package:wan_android_flutter/common_ui/navigation/navigation_bar_item.dart';

class NavigationBarWidget extends StatefulWidget {
  NavigationBarWidget(
      {super.key,
      required this.pages,
      required this.labels,
      required this.icons,
      required this.activeIcons,
      this.currentIndex,
      this.onPageChanged}) {
    if (pages.length != labels.length &&
        pages.length != icons.length &&
        pages.length != activeIcons.length) {
      throw Exception("数组长度必须一致！");
    }
  }

  final List<Widget> pages;

  final List<String> labels;

  final List<Widget> icons;

  final List<Widget> activeIcons;

  int? currentIndex = 0;

  ValueChanged<int>? onPageChanged;

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarWidgetState();
  }
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: widget.currentIndex,
          children: widget.pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex ?? 0,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        onTap: (index) {
          widget.currentIndex = index;
          widget.onPageChanged?.call(index);
          setState(() {});
        },
        items: _barItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _barItems() {
    List<BottomNavigationBarItem> items = [];

    for (int i = 0; i < widget.pages.length; i++) {
      items.add(BottomNavigationBarItem(
          icon: widget.icons[i],
          activeIcon:
              NavigationBarItem(builder: (context) => widget.activeIcons[i]),
          label: widget.labels[i]));
    }
    return items;
  }
}
