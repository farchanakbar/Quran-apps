import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Baca Al-Qur\'an',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: colorEmpat),
            ),
            const Text(
              'Created by Farchan Akbar',
              style: TextStyle(color: colorEmpat),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/hah.png'),
          ],
        ),
      ),
    );
  }
}
