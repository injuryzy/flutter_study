import 'dart:ffi';

import 'package:client_app/repository/datas/konwledge_detail_list_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'konwledge_detail_vm.dart';

class KnowledgeTabChildPage extends StatefulWidget {
  const KnowledgeTabChildPage({super.key, this.cid});

  final String? cid;

  @override
  State<KnowledgeTabChildPage> createState() => _KnowledgeTabChildPage();
}

class _KnowledgeTabChildPage extends State<KnowledgeTabChildPage> {
  KonwledgeDetailVm konwledgeDetailVm = KonwledgeDetailVm();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    konwledgeDetailVm.getDetail(false, widget.cid);
  }

  void refreshOrLoad(bool loadMore) {
    konwledgeDetailVm.getDetail(loadMore, widget.cid).then((value) {
      if (loadMore) {
        refreshController.loadComplete();
      } else {
        refreshController.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return konwledgeDetailVm;
    }, child: Scaffold(body: Consumer<KonwledgeDetailVm>(
      builder: (context, vm, child) {
        return SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onLoading: () {
            refreshOrLoad(true);
          },
          onRefresh: () {
            refreshOrLoad(false);
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              // return Text(vm.detailList?[index].title ?? "");
              return _ListViewItem(vm.detailList?[index]);
            },
            itemCount: vm.detailList?.length,
          ),
        );
      },
    )));
  }

  Widget _ListViewItem(KnowledgeTabItemData? item) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  item?.superChapterName ?? "",
                ),
                Expanded(child: SizedBox()),
                Text(DateTime.fromMillisecondsSinceEpoch(
                        item?.publishTime as int)
                    .toString()),
              ],
            ),
            Container(
              child: Text(item?.title ?? ""),
            ),
            Row(children: [
              Text(item?.chapterName ?? ""),
              Expanded(child: SizedBox()),
              Text(item?.author ?? item?.shareUser ?? "")
            ])
          ],
        ));
  }
}
