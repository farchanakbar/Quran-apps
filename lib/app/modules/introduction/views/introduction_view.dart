import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'package:alquran/app/constants/color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offAllNamed(Routes.BOTTOM_BAR);
      },
    );
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: colorSatu,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Al-Qur\'an Indonesia',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colorEmpat),
              ),
              const Text(
                'Created by Farchan Akbar',
                style: TextStyle(color: colorEmpat),
              ),
              Lottie.asset('assets/lotties/intro-quran.json'),
            ],
          ),
        ),
      ),
    );
  }
}
