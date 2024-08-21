import 'package:demo_poc_bloc/features/auth/data/repository/auth_repository.dart';
import 'package:demo_poc_bloc/features/auth/data/repository/auth_repository_impl.dart';
import 'package:demo_poc_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demo_poc_bloc/features/user_list/data/repository/user_repository.dart';
import 'package:demo_poc_bloc/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'features/user_list/data/repository/user_repository_impl.dart';
import 'features/user_list/presentation/bloc/user_bloc.dart';

void main() {
  final Dio dio = Dio();
  final UserRepository userRepository = UserRepositoryImpl(dio);
  final AuthRepository authRepository = AuthRepositoryImpl(dio);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

