import 'dart:async';

import 'package:client_app/repository/api.dart';
import 'package:client_app/repository/datas/common_website.dart';
import 'package:client_app/repository/datas/hot_key_vm.dart';
import 'package:flutter/widgets.dart';

class HotKeyViewModel with ChangeNotifier {
  List<HotKeyVm>? keyList = [];
  List<CommonWebsite>? webSiteList = [];

  //  获取热点数据和常用网站
  Future getHotKey() async {
    getCommonWebSiteList().then((value) {
      getHotKeyList().then((value) => {notifyListeners()});
    });
  }

  // 获取热点数据
  Future getHotKeyList() async {
    keyList = await Api.intertance.getHotKeyList();
  }

  // 获取常用网站数据
  Future getCommonWebSiteList() async {
    webSiteList = await Api.intertance.getCommonWebSiteList();
  }
}
