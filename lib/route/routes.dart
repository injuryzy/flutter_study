import 'package:client_app/common_ui/web/webview_widget.dart';
import 'package:client_app/pages/auth/login_page.dart';
import 'package:client_app/pages/auth/register_page.dart';
import 'package:client_app/pages/knowledge/detail/knowledge_detail_tab_page.dart';
import 'package:client_app/pages/person/person_page.dart';
import 'package:client_app/pages/search/search_page.dart';
import 'package:client_app/pages/tab_page.dart';
import 'package:flutter/material.dart';

import '../common_ui/web/webview_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tab:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.webViewPage:
        // return pageRoute(WebViewPage(title: "首页"), settings: settings);
        return pageRoute(
            WebviewPage(loadResource: "", webViewType: WebViewType.URL),
            settings: settings);
      case RoutePath.loginPage:
        return pageRoute(LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(RegisterPage(), settings: settings);
      case RoutePath.personPage:
        return pageRoute(PersonPage(), settings: settings);
      case RoutePath.detailKnowledgePage:
        return pageRoute(KnowledgeDetailTabPage(), settings: settings);
      case RoutePath.searchPage:
        return pageRoute(SearchPage(), settings: settings);
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
  static const String tab = "/";

  // 网页页面
  static const String webViewPage = "/web_view_page";
  static const String loginPage = "/login";
  static const String registerPage = "/register";
  static const String personPage = "/person";
  static const String detailKnowledgePage = "/knowledge_detail_page";
  static const String searchPage = "/search_page";
}
