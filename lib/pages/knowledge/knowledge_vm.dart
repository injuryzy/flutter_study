import 'package:client_app/repository/api.dart';
import 'package:flutter/cupertino.dart';

import '../../repository/datas/knowledge_list_data.dart';

class KnowledgeVm with ChangeNotifier {
  List<KnowledgeItemData>? list;

  Future getKnowledgeListData() async {
    list = await Api.intertance.getKnowledgeListData();
    notifyListeners();
  }
}

String generalSubTitle(List<KnoledgeChildren?>? children) {
  if (children == null || children == []) {
    return "";
  }
  String subtitle = "";
  StringBuffer buffer = StringBuffer();
  children.forEach((e) {
    buffer.write("${e?.name} ");
  });

  return buffer.toString();
}
