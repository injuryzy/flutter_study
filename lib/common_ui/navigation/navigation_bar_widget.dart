import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget(
      {super.key,
      required this.pages,
      required this.labels,
      required this.icons,
      required this.activeIcons});

  //  页面数组
  final List<Widget> pages;

  //  底部数据
  final List<String> labels;

  // 导航栏切换前
  final List<Widget> icons;

  //  导航栏切换后
  final List<Widget> activeIcons;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: currentIndex,
          children: widget.pages,
        )),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black87),
            unselectedLabelStyle:
                TextStyle(fontSize: 12, color: Colors.blueGrey),
            currentIndex: currentIndex,
            items: _barList(),
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
          ),
        ));
  }
  List<BottomNavigationBarItem> _barList() {
    List<BottomNavigationBarItem> list = [];
    list.add(BottomNavigationBarItem(
      label: "首页",
      backgroundColor: Colors.white,
      icon: SvgPicture.asset("assets/images/home.svg", width: 32, height: 32),
      activeIcon: SvgPicture.asset("assets/images/home.svg",
          color: Colors.black87, width: 32, height: 32),
    ));
    list.add(BottomNavigationBarItem(
        label: "热点",
        backgroundColor: Colors.white,
        icon: SvgPicture.asset("assets/images/hot_spot.svg",
            width: 32, height: 32),
        activeIcon: SvgPicture.asset("assets/images/hot_spot.svg",
            color: Colors.black87, width: 32, height: 32)));
    list.add(BottomNavigationBarItem(
        label: "体系",
        backgroundColor: Colors.white,
        icon: SvgPicture.asset("assets/images/knowledge.svg",
            width: 32, height: 32),
        activeIcon: SvgPicture.asset("assets/images/knowledge.svg",
            color: Colors.black87, width: 32, height: 32)));
    list.add(BottomNavigationBarItem(
        label: "我的",
        backgroundColor: Colors.white,
        icon:
        SvgPicture.asset("assets/images/person.svg", width: 32, height: 32),
        activeIcon: SvgPicture.asset("assets/images/person.svg",
            color: Colors.black87, width: 32, height: 32)));

    return list;
  }
}
