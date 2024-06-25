import 'package:client_app/repository/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

class AuthViewMode with ChangeNotifier {
  RegisterInfo registerInfo = RegisterInfo();
  LoginInfo loginInfo = LoginInfo();

  Future<bool> register() async {
    bool resp = false;
    if (registerInfo.rePassword!.isNotEmpty &&
        registerInfo.password != null &&
        registerInfo.name != null) {
      resp = await Api.intertance.register(
        name: registerInfo.name,
        password: registerInfo.password,
        rePassword: registerInfo.rePassword,
      );
    } else {
      showToast("密码不能为空,并且密码必须一至");
    }
    return resp;
  }

  Future<bool> login() async {
    bool resp = false;
    if (loginInfo.name!.isNotEmpty && loginInfo.password!.isNotEmpty) {
      resp = await Api.intertance.login(
        name: loginInfo.name,
        password: loginInfo.password,
      );
    } else {
      showToast("用户名和密码不能为空");
    }
    if (resp) {
      UserName = loginInfo.name ?? "";
    }
    return resp;
  }
}

class RegisterInfo {
  String? name;
  String? password;
  String? rePassword;
}

class LoginInfo {
  String? name;
  String? password;
}

String UserName = "未登录";

//  获取登录名称
Future<String?> getUserName() async {
  return UserName;
}

Future<bool> isLoginOut() async {
  bool? isLoginOut = await Api.intertance.loginOut();
  return isLoginOut ?? false;
}
