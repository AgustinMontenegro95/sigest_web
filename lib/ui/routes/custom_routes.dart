import 'package:flutter/material.dart';
import 'package:sigest/ui/pages/home/home_page.dart';

import 'package:sigest/ui/pages/login/login_page.dart';
import 'package:sigest/ui/pages/login/reset_pass_page.dart';

var customRoutes = <String, WidgetBuilder>{
  '/home': (context) => const HomePage(),
  '/login': (context) => const LogInPage(),
  '/resetpass': (context) => const ResetPassPage(),
};
