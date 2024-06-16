import 'dart:async';

import 'package:client_app/http/dio_instance.dart';
import 'package:client_app/repository/api.dart';
import 'package:client_app/repository/datas/home_banner_data.dart';
import 'package:client_app/repository/datas/home_list_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  List<ListBannerItem?>? bannerList=[];

  List<HomeListItemData>? homeDataList=[];

  //  获取banner
  Future getBanner() async {
    bannerList = await Api.intertance.getBanner() ?? [];
    notifyListeners();
  }

  Future initHomeList() async {
    getTopList();
    getHomeList();
  }

  // 获取首页列表
  Future getHomeList() async {
    homeDataList?.addAll(await Api.intertance.getHomeList() ?? []);
    notifyListeners();
  }

// 获取首页置顶列表
  Future getTopList() async {
    List<HomeListItemData>? topList =
        await Api.intertance.getHomeTopList() ?? [];
    homeDataList?.clear();
    homeDataList?.addAll(topList);
  }
}
