import 'package:flutter/material.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<KnowledgePage> createState() => _KonwledgePageState();
}

class _KonwledgePageState extends State<KnowledgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("konwledge"),
      )),
    );
  }
}
