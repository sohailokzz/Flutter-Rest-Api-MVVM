import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_mvvp/utils/routes/routes.dart';
import 'package:rest_api_mvvp/view_model/auth_view_model.dart';
import 'package:rest_api_mvvp/view_model/user_view_model.dart';

import 'utils/routes/route_names.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rest API MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
