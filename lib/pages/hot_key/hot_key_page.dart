import 'package:client_app/common_ui/web/webview_page.dart';
import 'package:client_app/common_ui/web/webview_widget.dart';
import 'package:client_app/pages/hot_key/hot_key_vm.dart';
import 'package:client_app/pages/search/search_page.dart';
import 'package:client_app/repository/datas/common_website.dart';
import 'package:client_app/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:client_app/repository/datas/hot_key_vm.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({super.key});

  @override
  State<HotKeyPage> createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotKeyPage> {
  HotKeyViewModel viewModel = HotKeyViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getHotKey();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return viewModel;
        },
        child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(6),
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(width: 1, color: Colors.grey),
                    )),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchPage();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '搜索热词',
                            style: TextStyle(fontSize: 14),
                          ),
                          // Expanded(child: SizedBox()),
                          SvgPicture.asset(
                            "assets/images/search.svg",
                            color: Colors.blueGrey,
                            width: 20,
                            height: 20,
                          )
                        ],
                      ),
                    )),
                //    搜索热词
                Consumer<HotKeyViewModel>(builder: (context, vm, child) {
                  return _gridView(false, keyList: vm.keyList,
                      itemTap: (value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchPage(
                        keyWords: value,
                      );
                    }));
                  });
                }),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey),
                    bottom: BorderSide(width: 0.5, color: Colors.grey),
                  )),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                  child: Text(
                    "常用网站",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                Consumer<HotKeyViewModel>(builder: (context, vm, child) {
                  return _gridView(true, webSiteList: vm.webSiteList,
                      itemTap: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WebviewPage(
                          loadResource: value ?? "",
                          webViewType: WebViewType.HTMLTEXT,
                        );
                      }),
                    );
                  });
                }),
              ],
            ),
          )),
        ));
  }

  Widget _gridView(bool isWebSite,
      {ValueChanged<String>? itemTap,
      List<HotKeyVm>? keyList,
      List<CommonWebsite>? webSiteList}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //  主轴间隔
            mainAxisSpacing: 8,
            // 最大横轴范围
            maxCrossAxisExtent: 150.0,
            childAspectRatio: 3,
            crossAxisSpacing: 8),
        itemBuilder: (context, index) {
          return _Item(
              isWebSite ? (webSiteList?[index].name) : (keyList?[index].name),
              itemTap: itemTap,
              link: isWebSite ? (webSiteList?[index].link) : "");
        },
        itemCount: isWebSite ? webSiteList?.length : keyList?.length,
      ),
    );
  }

  Widget _Item(String? name, {ValueChanged<String>? itemTap, String? link}) {
    return GestureDetector(
        onTap: () {
          if (link!.isNotEmpty) {
            itemTap?.call(link);
          } else {
            itemTap?.call(name ?? "");
          }
        },
        child: Container(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              name ?? "",
              style: TextStyle(fontSize: 12),
            ),
            padding: EdgeInsets.all(4),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ));
  }
}
