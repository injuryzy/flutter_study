import 'package:client_app/http/base_model.dart';
import 'package:client_app/repository/datas/common_website.dart';
import 'package:client_app/repository/datas/home_banner_data.dart';
import 'package:client_app/repository/datas/home_list_data.dart';
import 'package:client_app/repository/datas/hot_key_vm.dart';
import 'package:dio/dio.dart';
import 'package:client_app/http/dio_instance.dart';
import 'package:oktoast/oktoast.dart';

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

  // 获取热点数据
  Future<List<HotKeyVm>?> getHotKeyList() async {
    Response response = await DioInstance.instance().get(path: "/hotkey/json");
    HotKeyList hotKeyList = HotKeyList.fromJson(response.data);
    return hotKeyList.list;
  }

  // 获取常用网站数据
  Future<List<CommonWebsite>?> getCommonWebSiteList() async {
    Response response = await DioInstance.instance().get(path: "/friend/json");
    CommonWebsiteListData commonWebsiteListData =
        CommonWebsiteListData.fromJson(response.data);
    return commonWebsiteListData.websiteList;
  }

//    注册
  Future<bool> register(
      {String? name, String? password, String? rePassword}) async {
    Response response = await DioInstance.instance().post(
        path: "/user/register",
        queryParameters: {
          "username": name,
          "password": password,
          "repassword": rePassword
        });
    if (response.data is String) {
      showToast(response.data);
      return false;
    }
    return true;
  }

  //    登录
  Future<bool> login({String? name, String? password}) async {
    Response response = await DioInstance.instance()
        .post(path: "/user/login", queryParameters: {
      "username": name,
      "password": password,
    });
    if (response.data is String) {
      showToast(response.data);
      return false;
    }
    return true;
  }
}
