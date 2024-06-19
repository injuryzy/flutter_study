import 'package:client_app/pages/home/home_vm.dart';
import 'package:client_app/repository/datas/home_list_data.dart';
import 'package:client_app/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    viewModel.getBanner();
    viewModel.initHomeList(false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            enablePullDown: true,
            // header: ClassicFooter(),
            // footer: ClassicFooter(),

            onLoading: () {
              viewModel.initHomeList(true, callback: (loadMore) {
                refreshController.loadComplete();
              });
            },
            onRefresh: () {
              viewModel.getBanner().then((value) {
                viewModel.initHomeList(false, callback: (loadMore) {
                  refreshController.refreshCompleted();
                });
              });
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _banner(),
                  listView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _listItemView(vm.homeDataList?[index]);
        },
        itemCount: vm.homeDataList?.length ?? 0,
      );
    });
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        height: 150,
        width: double.infinity,
        child: Swiper(
            itemCount: vm.bannerList?.length ?? 0,
            indicatorLayout: PageIndicatorLayout.NONE,
            autoplay: true,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 120,
                child: Image.network(vm.bannerList?[index]?.imagePath ?? ""),
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              );
            }),
      );
    });
  }

  Widget _listItemView(HomeListItemData? item) {
    String name = "";
    if (item?.author?.isEmpty == true) {
      name = item?.shareUser ?? "";
    } else {
      name = item?.author ?? "";
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutePath.webViewPage, arguments: {
          "name": "使用路由传值",
        });
        /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return WebViewPage(
              title: '首页',
            );
          }),
        );*/
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
        padding: EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/images/avatre.png",
                    width: 50,
                    height: 50,
                    // fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(child: SizedBox()),
                Text(
                  item?.niceShareDate ?? "今天",
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
                SizedBox(width: 10),
                (item?.type?.toInt() == 1)
                    ? Text(
                        "置顶",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    : SizedBox(),
              ],
            ),
            Text(
              item?.title ?? "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text(
                  "分类",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 11,
                  ),
                ),
                Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/collection.png",
                  width: 30,
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
