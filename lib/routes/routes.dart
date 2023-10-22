import 'package:demo_users/pages/createUser.page.dart';
import 'package:demo_users/pages/userList.page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes{
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final navigator = navigatorKey.currentState;
  static final routes = {
    "/createUser": (_) => const CreateUserPage(),
    "/userList": (_) => const UserListPage(),
  };
}