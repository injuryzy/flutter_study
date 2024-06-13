import 'package:client_app/pages/home/home_page.dart';
import 'package:client_app/pages/web_view_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(title: "首页"), settings: settings);
    }
    return pageRoute(
      Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('${settings.name}不存在'),
          ),
        ),
      ),
    );
  }

  static MaterialPageRoute pageRoute(Widget page, {RouteSettings? settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return page;
      },
    );
  }
}

class RoutePath {
  static const String home = "/";
  static const String webViewPage = "/web_view_page";
}
