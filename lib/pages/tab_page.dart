import 'package:client_app/pages/home/home_page.dart';
import 'package:client_app/pages/hot_key/hot_key_page.dart';
import 'package:client_app/pages/knowledge/knowledge_page.dart';
import 'package:client_app/pages/person/person_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: currentIndex,
          children: [HomePage(), HotKeyPage(), KnowledgePage(), PersonPage()],
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
