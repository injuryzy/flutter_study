import 'package:client_app/pages/search/search_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../repository/datas/search_keywords.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, this.keyWords});

  final String? keyWords;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController inputController =
      TextEditingController(text: widget.keyWords ?? "");

  SearchVm vm = SearchVm();

  @override
  void initState() {
    super.initState();
    vm.search(false, widget.keyWords);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return vm;
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            _searchBar((e) {
              vm.search(false, e);
              Focus.of(context).unfocus();
            }),
            Consumer<SearchVm>(builder: (context, vm, child) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _listItem(vm.searchList?[index]);
                  },
                  itemCount: vm.searchList?.length ?? 0,
                ),
              );
            })
          ],
        ),
      )),
    );
  }

  Widget _listItem(SearchRespItem? item) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Html(data: item?.title),
      ),
    );
  }

  Widget _searchBar(ValueChanged<String>? onSubmitted) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10),
      color: Colors.teal,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/back.png", width: 30, height: 30),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onSubmitted: onSubmitted,
            controller: inputController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
          )),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
              onTap: () {
                inputController.text = '';
                vm.clear();
                Focus.of(context).unfocus();
                // Navigator.pop(context);
              },
              child: Text("取消")),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
