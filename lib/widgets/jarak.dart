import 'package:alquran/app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jarak extends StatelessWidget {
  const Jarak({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorEmpat,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 1,
      width: Get.width,
    );
  }
}
