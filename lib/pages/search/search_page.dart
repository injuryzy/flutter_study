import 'package:client_app/pages/search/search_vm.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement initState
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
            }),
            Consumer<SearchVm>(builder: (context, vm, child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(vm.searchList?[index].title ?? "");
                },
                itemCount: vm.searchList?.length ?? 0,
              );
            })
          ],
        ),
      )),
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
                Navigator.pop(context);
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
