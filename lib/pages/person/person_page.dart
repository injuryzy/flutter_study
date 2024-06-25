import 'package:client_app/pages/person/person_vm.dart';
import 'package:client_app/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  PersonViewModel personViewModel = PersonViewModel();

  @override
  void initState() {
    personViewModel.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) {
        return personViewModel;
      },
      child: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            _header(() {
              if (personViewModel.shouldLogin) {
                Navigator.pushNamed(context, RoutePath.loginPage);
              }
            }),
            _settingItem("我的收藏", () {}),
            _settingItem("检查更新", () {}),
            _settingItem("关于我们", () {}),
            _loginOut(() {
              if (personViewModel.shouldLogin) {
                showToast("没有登录");
                return;
              }
              personViewModel.loginOut();
              showToast("退出成功");
            }),
          ],
        ),
      )),
    ));
  }

  Widget _settingItem(String title, GestureTapCallback? onTap) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          padding: EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15),
              ),
              // Expanded(child: SizedBox()),
              Image.asset(
                "assets/images/right.png",
                width: 20,
                height: 20,
              )
            ],
          ),
        ));
  }

  Widget _header(GestureTapCallback? onTap) {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.teal,
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            "assets/images/head.png",
            width: 70,
            height: 70,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Consumer<PersonViewModel>(builder: (context, vm, child) {
          return GestureDetector(
            onTap: onTap,
            child: Text(
              vm.username ?? "",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          );
        })
      ]),
    );
  }

  Widget _loginOut(GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white38,
            border: Border.all(width: 0.5, color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        height: 40,
        width: 200,
        margin: EdgeInsets.only(top: 30),
        child: Text('退出登录', style: TextStyle(fontSize: 19)),
      ),
    );
  }
}
