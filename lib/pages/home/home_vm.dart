import 'dart:ffi';

import 'package:client_app/datas/home_banner_data.dart';
import 'package:client_app/datas/home_list_data.dart';
import 'package:client_app/http/dio_instance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  List<ListBannerItem>? bannerList;

  List<HomeListItemData>? homeDataList;

  //  获取banner
  Future getBanner() async {
    Response response = await DioInstance.instance().get(path: "/banner/json");
    HomeBannerData homeBannerData = HomeBannerData.fromJson(response.data);
    if (homeBannerData != null && homeBannerData.data != null) {
      bannerList = homeBannerData.data;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  // 获取首页列表
  Future getHomeList() async {
    Response response =
        await DioInstance.instance().get(path: "/article/list/1/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    if (homeData != null && homeData.data != null) {
      homeDataList = homeData.data?.datas;
    } else {
      homeDataList = [];
    }
    notifyListeners();
  }
}
