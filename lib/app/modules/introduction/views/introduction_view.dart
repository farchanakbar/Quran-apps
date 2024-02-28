import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/routes/app_pages.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Al-Quran Apps',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: colorTiga),
            ),
            const Text('Created by Farchan Akbar'),
            Lottie.asset('assets/lotties/intro-quran.json'),
          ],
        ),
      ),
    );
  }
}
