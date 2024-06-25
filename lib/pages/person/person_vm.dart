import 'package:flutter/material.dart';

import '../auth/auth_vm.dart';

class PersonViewModel with ChangeNotifier {
  String? username;
  bool shouldLogin = true;

  Future initData() async {
    getUserName().then((e) {
      if (e == '未登录') {
        username = '未登录';
      } else {
        shouldLogin = false;
        username = e;
      }
      notifyListeners();
    });
  }

  Future loginOut() async {
    isLoginOut().then((e) {
      if (e) {
        shouldLogin = false;
        username = '未登录';
        notifyListeners();
      }
    });
  }
}
