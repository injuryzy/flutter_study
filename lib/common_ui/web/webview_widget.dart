import 'dart:math';

import 'package:client_app/common_ui/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum WebViewType { HTMLTEXT, URL }

typedef dynamic JsChannelCallBack(List<dynamic> argument);

class WebViewScreen extends StatefulWidget {
  const WebViewScreen(
      {super.key,
      this.url,
      this.clearCache,
      required this.loadResource,
      this.jsChannelMap,
      required this.webViewType,
      this.onWebViewCreated});

  final String? url;

  final WebViewType webViewType;
  final bool? clearCache;
  final String loadResource;
  final Map<String, JsChannelCallBack>? jsChannelMap;
  final Function(InAppWebViewController controller)? onWebViewCreated;

  // final Webviewt

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController? webViewController;
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(
          builtInZoomControls: false, useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialOptions: options,
      onWebViewCreated: (controller) {
        webViewController = controller;
        if (widget.clearCache == true) {
          controller.clearCache();
        }
        if (widget.onWebViewCreated == null) {
          if (widget.webViewType == WebViewType.HTMLTEXT) {
            webViewController?.loadData(data: widget.loadResource ?? "");
          } else if (widget.webViewType == WebViewType.URL) {
            webViewController?.loadUrl(
                urlRequest: URLRequest(url: Uri.parse(widget.loadResource)));
          }
        } else {
          widget.onWebViewCreated?.call(controller);
        }
        webViewController?.loadUrl(
            urlRequest: URLRequest(url:Uri.parse(widget.loadResource)));
      },
      onConsoleMessage: (controller, consoleMessage) {
        print("consoleMessage================\n ${consoleMessage.message}");
      },
      onProgressChanged: (InAppWebViewController controller, int progress) {
        log(progress);
      },
      onLoadStart: (InAppWebViewController controller, Uri? url) {
        Loading.showLoading(Duration(seconds: 45));
      },
      onLoadError: (InAppWebViewController controller, Uri? url, int code,
          String message) {
        print("onLoadError================\n ${message}");
      },

      onLoadStop: (InAppWebViewController controller, Uri? url) {
        Loading.dismissAll();
      },
      onPageCommitVisible: (InAppWebViewController controller, Uri? url) {
        Loading.dismissAll();
      },
    );
  }
}
