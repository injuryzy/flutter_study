import 'dart:async';

import 'package:client_app/http/dio_instance.dart';
import 'package:client_app/repository/api.dart';
import 'package:client_app/repository/datas/home_banner_data.dart';
import 'package:client_app/repository/datas/home_list_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../common_ui/loading.dart';

class HomeViewModel with ChangeNotifier {
  List<ListBannerItem?>? bannerList = [];

  List<HomeListItemData>? homeDataList = [];
  int pageCount = 0;

  //  获取banner
  Future getBanner() async {
    bannerList = await Api.intertance.getBanner() ?? [];
    notifyListeners();
  }

  Future initHomeList(bool lodeMore, {ValueChanged<bool>? callback}) async {

    if (lodeMore) {
      pageCount++;
    } else {
      pageCount = 1;
      homeDataList?.clear();
    }

    getTopList(lodeMore);
    getHomeList(lodeMore).then((allList) {
      homeDataList?.addAll(allList ?? []);
      Loading.dismissAll();
      notifyListeners();
      callback?.call(lodeMore);
    });
  }

  // 获取列表数据
  Future<List<HomeListItemData>?> getHomeList(bool lodeMore) async {
    List<HomeListItemData>? list =
        await Api.intertance.getHomeList(pageCount.toString());
    if (list != null && list.isNotEmpty) {
      return list;
    } else {
      /* if (lodeMore && pageCount > 0) {
        pageCount--;
      }*/
      return [];
    }
  }

// 获取首页置顶列表
  Future<List<HomeListItemData>?>? getTopList(bool lodeMore) async {
    if (lodeMore) {
      return [];
    }
    List<HomeListItemData>? topList =
        await Api.intertance.getHomeTopList() ?? [];
    return topList;
  }

//   收藏的接口
  Future collect(String? id, int index) async {
    bool? isCollect = await Api.intertance.collect(id);
    if (isCollect == true) {
      homeDataList?[index].collect = true;
      notifyListeners();
    }
  }

  //  取消收藏
  Future uncollect(String? id, int index) async {
    bool? isCollect = await Api.intertance.uncollect(id);
    if (isCollect == true) {
      homeDataList?[index].collect = false;
      notifyListeners();
    }
  }
}
