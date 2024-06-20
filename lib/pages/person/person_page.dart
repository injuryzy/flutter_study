import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/head.png",
              width: 64,
              height: 64,
            ),
            Text(
              '未登录',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
