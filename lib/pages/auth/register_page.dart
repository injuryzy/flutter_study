import 'package:flutter/material.dart';

import '../../common_ui/common_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            commonInput("请输入账号"),
            SizedBox(
              height: 20,
            ),
            commonInput("输入密码", isPassword: true),
            SizedBox(
              height: 20,
            ),
            commonInput("再次输入密码", isPassword: true),
            whiteBordButton(
                title: "点击注册",
                onTap: () {
                  print("点击注册");
                }),
          ],
        ),
      ),
    );
  }
}
