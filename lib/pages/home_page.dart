import 'package:client_app/pages/web_view_page.dart';
import 'package:client_app/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _banner(),
            ListView.builder(
                  shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _listItemView();
              },
              itemCount: 100,
            )
          ],
        ),
      )),
    );
  }

  Widget _banner() {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Swiper(
          itemCount: 3,
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 150,
              color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            );
          }),
    );
  }

  Widget _listItemView() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutePath.webViewPage, arguments: {
          "name": "使用路由传值",
        });
        /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return WebViewPage(
              title: '首页',
            );
          }),
        );*/
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
        padding: EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    "https://img0.baidu.com/it/u=2955332398,1712446780&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1718298000&t=9fb347906839deb720c43bc4a39d477f",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "作者",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "2024-10-11",
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
                SizedBox(width: 10),
                Text(
                  "置顶",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Text(
                  "分类",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 11,
                  ),
                ),
                Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/collection.png",
                  width: 30,
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
