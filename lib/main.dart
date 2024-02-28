import 'package:alquran/app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      title: "Application",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
    ),
  );
}
