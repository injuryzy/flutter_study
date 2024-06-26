import 'package:client_app/repository/api.dart';
import 'package:client_app/repository/datas/search_keywords.dart';
import 'package:flutter/cupertino.dart';

class SearchVm with ChangeNotifier {
  int page = 0;
  List<SearchRespItem>? searchList = [];

  Future search(bool lodeMore, String? keywords) async {
    if (lodeMore) {
      page = ++page;
    } else {
      page = 0;
    }
    searchList = await Api.intertance.searchKeywords('${page}', keywords);
    notifyListeners();
  }

  void clear() {
    searchList?.clear();
  }
}
