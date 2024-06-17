import 'package:client_app/repository/datas/home_banner_data.dart';
import 'package:client_app/repository/datas/home_list_data.dart';
import 'package:dio/dio.dart';
import 'package:client_app/http/dio_instance.dart';

class Api {
  static Api intertance = Api._();

  Api._();

  //  获取banner
  Future<List<ListBannerItem?>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: "/banner/json");
    HomeBannerListData homeBannerData =
        HomeBannerListData.fromJson(response.data);
    return homeBannerData.bannerList;
  }

  // 获取首页列表
  Future<List<HomeListItemData>?> getHomeList(String pageCount) async {
    Response response =
        await DioInstance.instance().get(path: "/article/list/$pageCount/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  // 获取首页置顶列表
  Future<List<HomeListItemData>?> getHomeTopList() async {
    Response response =
        await DioInstance.instance().get(path: "/article/top/json");
    HomeTopListData homeData = HomeTopListData.fromJson(response.data);
    return homeData.topList;
  }
}
