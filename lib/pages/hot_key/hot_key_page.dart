import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({super.key});

  @override
  State<HotKeyPage> createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotKeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("hotKey"),
      )),
    );
  }
}
