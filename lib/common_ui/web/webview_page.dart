import 'package:client_app/common_ui/web/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage(
      {super.key,
      this.showTitle,
      this.title,
      required this.webViewType,
      required this.loadResource,
      this.jsChannelMap});

  final bool? showTitle;
  final String? title;
  final WebViewType webViewType;
  final String loadResource;
  final Map<String, JsChannelCallBack>? jsChannelMap;

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (widget.showTitle ?? false)
            ? AppBar(
                title: _buildAppBarTitle(widget.showTitle, widget.title),
              )
            : null,
        body: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: WebViewScreen(
            webViewType: widget.webViewType,
            loadResource: widget.loadResource,
            jsChannelMap: widget.jsChannelMap,
          ),
        ));
  }

  Widget _buildAppBarTitle(bool? showTitle, String? title) {
    var show = showTitle ?? false;
    return show
        ? Html(
            data: title ?? "", style: {"html": Style(fontSize: FontSize(15))})
        : const SizedBox.shrink();
  }

  String limitStr(String? content, {int limit = 15}) {
    if (content == null || content.isEmpty == true) {
      return "";
    }
    if (content.length > 15) {
      return content.substring(0, 15);
    } else {
      return content;
    }
  }
}
