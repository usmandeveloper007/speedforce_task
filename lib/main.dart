import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiring_task/app/routes/app_routes.dart';
import 'package:hiring_task/app/routes/route_names.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E Khata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splashScreen,
      getPages: AppRoutes.routes,

    );
  }
}

