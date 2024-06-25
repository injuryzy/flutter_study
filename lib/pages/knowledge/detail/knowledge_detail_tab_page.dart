import 'package:client_app/pages/knowledge/detail/knowledge_tab_child_page.dart';
import 'package:client_app/pages/knowledge/detail/konwledge_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../repository/datas/knowledge_list_data.dart';


class KnowledgeDetailTabPage extends StatefulWidget {
  const KnowledgeDetailTabPage({super.key, this.list});

  final List<KnoledgeChildren>? list;

  @override
  State<KnowledgeDetailTabPage> createState() => _KnowledgeDetailTabPageState();
}

class _KnowledgeDetailTabPageState extends State<KnowledgeDetailTabPage>
    with SingleTickerProviderStateMixin {
  KonwledgeDetailVm konwledgeDetailVm = KonwledgeDetailVm();

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =
        TabController(length: widget.list?.length ?? 0, vsync: this);
    konwledgeDetailVm.initTabs(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return konwledgeDetailVm;
        },
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: konwledgeDetailVm.tabs,
              controller: tabController,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: children(),
          ),
        ));
  }

  List<Widget> children() {
    return widget.list?.map((e) {
          return KnowledgeTabChildPage(cid:'${e.id}');
        }).toList() ??
        [];
  }
}
