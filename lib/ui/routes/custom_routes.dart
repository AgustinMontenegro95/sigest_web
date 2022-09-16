import 'package:flutter/material.dart';

import 'package:sigest/ui/pages/login/login_page.dart';
import 'package:sigest/ui/pages/login/reset_pass_page.dart';
import 'package:sigest/web/home/home_web_page.dart';

var customRoutes = <String, WidgetBuilder>{
  '/homeDesktop': (context) => const HomeWebPage(),
  '/login': (context) => const LogInPage(),
  '/resetpass': (context) => const ResetPassPage(),
};
