import 'package:client_app/pages/auth/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../common_ui/common_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthViewMode authViewMode = AuthViewMode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return authViewMode;
        },
        child: Scaffold(
          backgroundColor: Colors.teal,
          body: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              child: Consumer<AuthViewMode>(builder: (context, vm, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonInput(
                      "请输入账号",
                      onChanged: (value) {
                        vm.registerInfo.name = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    commonInput(
                      "输入密码",
                      isPassword: true,
                      onChanged: (value) {
                        vm.registerInfo.password = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    commonInput(
                      "再次输入密码",
                      isPassword: true,
                      onChanged: (value) {
                        vm.registerInfo.rePassword = value;
                      },
                    ),
                    whiteBordButton(
                        title: "点击注册",
                        onTap: () {
                          print(vm.registerInfo);
                          vm.register().then((value) {
                            if (value) {
                              showToast("注册成功");
                              Navigator.pop(context);
                            }
                          });
                        }),
                  ],
                );
              })),
        ));
  }
}
