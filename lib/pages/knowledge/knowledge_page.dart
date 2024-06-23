import 'package:client_app/pages/knowledge/knowledge_vm.dart';
import 'package:client_app/repository/datas/knowledge_list_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<KnowledgePage> createState() => _KonwledgePageState();
}

class _KonwledgePageState extends State<KnowledgePage> {
  KnowledgeVm _knowledgeVm = KnowledgeVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _knowledgeVm.getKnowledgeListData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return _knowledgeVm;
        },
        child: Scaffold(
          body: SafeArea(
            child: Consumer<KnowledgeVm>(builder: (context, vm, child) {
              return ListView.builder(
                itemCount: vm.list?.length,
                itemBuilder: (context, index) {
                  return _knowledgeItem(vm.list?[index]);
                },
              );
            },
            ),
          ),
        ));
  }

  Widget _knowledgeItem(KnowledgeItemData? item) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.name ?? "",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
                Text(generalSubTitle(item?.children),style: TextStyle(fontSize: 13,color: Colors.grey),),
              ],
            ),
          ),
          Image.asset(
            "assets/images/right.png",
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
