import 'package:client_app/route/routes.dart';
import 'package:flutter/material.dart';

import 'package:client_app/common_ui/common_style.dart';
import 'package:oktoast/oktoast.dart';
import '../person/person_vm.dart';
import 'auth_vm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? inputController;
  TextEditingController? passwordController;
  AuthViewMode authViewMode = AuthViewMode();
  PersonViewModel personViewModel = PersonViewModel();

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    passwordController = TextEditingController();
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
            commonInput("请输入用户名", controller: inputController),
            SizedBox(
              height: 20,
            ),
            commonInput("输入密码",
                isPassword: true, controller: passwordController),
            whiteBordButton(
                title: "点击登录",
                onTap: () {
                  authViewMode.loginInfo.password =
                      passwordController?.value.text;
                  authViewMode.loginInfo.name = inputController?.value.text;
                  authViewMode.login().then((e) {
                    if (e) {
                      showToast("登录成功");
                      Navigator.pushNamed(context, RoutePath.personPage);
                    }
                  });
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
