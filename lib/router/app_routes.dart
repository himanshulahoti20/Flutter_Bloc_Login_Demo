import 'package:demo_poc_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:demo_poc_bloc/features/auth/presentation/screens/register_screen.dart';
import 'package:demo_poc_bloc/features/user_list/presentation/screens/user_list_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String userList = '/userList';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case userList:
        return MaterialPageRoute(builder: (_) => UserListScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
