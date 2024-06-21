import 'package:client_app/route/routes.dart';
import 'package:flutter/material.dart';

import '../../common_ui/common_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonInput("请输入用户名"),
            SizedBox(
              height: 20,
            ),
            commonInput("输入密码", isPassword: true),
            whiteBordButton(
                title: "点击登录",
                onTap: () {
                  print("点击登录");
                }),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.registerPage);
                },
                child: Text(
                  '注册',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              margin: EdgeInsets.only(top: 15),
            )
          ],
        ),
      ),
    );
  }
}
