import 'package:bobby_portfolio/modules/portfolio/portfolio_binding.dart';
import 'package:bobby_portfolio/views/feature/portfolio_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialBinding: PortfolioBinding(),
      home: PortfolioView(),
    );
  }
}
