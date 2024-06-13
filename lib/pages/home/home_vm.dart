import 'dart:ffi';

import 'package:client_app/datas/home_banner_data.dart';
import 'package:client_app/datas/home_list_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  List<ListBannerItem>? bannerList;

  List<HomeListItemData>? homeDataList;
  var dio = Dio();

  void initDio() {
    dio.options = BaseOptions(
      method: "GET",
      baseUrl: "https://www.wanandroid.com",
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    );
  }

  //  获取banner
  Future getBanner() async {
    Response response = await dio.get("/banner/json");
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
    Response response = await dio.get("/article/list/1/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    if (homeData != null && homeData.data != null) {
      homeDataList = homeData.data?.datas;
    }else{
      homeDataList = [];
    }
    notifyListeners();
  }
}
