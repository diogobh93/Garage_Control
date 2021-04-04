import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/constants/app_color.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garage Control',
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: AppColor.primary,
        accentColor: AppColor.secondary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
