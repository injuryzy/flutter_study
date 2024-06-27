import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Loading {
  Loading._();

  static Future showLoading(Duration? duration) async {
    showToastWidget(
        Container(
          color: Colors.transparent,
          constraints: const BoxConstraints.expand(),
          child: Align(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ),
        duration: duration ?? Duration(days: 1),
        handleTouch: true);
  }

  static void dismissAll() {
    dismissAllToast();
  }
}
