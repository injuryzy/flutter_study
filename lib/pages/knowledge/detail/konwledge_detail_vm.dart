import 'package:client_app/repository/api.dart';
import 'package:client_app/repository/datas/knowledge_list_data.dart';
import 'package:flutter/material.dart';

import '../../../repository/datas/konwledge_detail_list_data.dart';

class KonwledgeDetailVm with ChangeNotifier {
  List<Tab> tabs = [];
  int page = 0;
  List<KnowledgeTabItemData>? detailList = [];

  void initTabs(List<KnoledgeChildren>? list) {
    list?.forEach((e) {
      tabs.add(Tab(
        text: e.name ?? "",
      ));
    });
  }

  Future getDetail(bool loadmore, String? cid) async {
    if (loadmore) {
      page = ++page;
    } else {
      page = 0;
      detailList?.clear();
    }
    var list = await Api.intertance.getKnowledgeList(cid, '${page}');
    if (list?.isNotEmpty == true) {
      detailList?.addAll(list ?? []);
    }
    notifyListeners();
  }
}
