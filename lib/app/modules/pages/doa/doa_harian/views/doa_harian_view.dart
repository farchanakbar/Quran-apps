import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doa_harian_controller.dart';

class DoaHarianView extends GetView<DoaHarianController> {
  const DoaHarianView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Do\'a & Asmaul-Husna',
          style: TextStyle(color: colorEmpat),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TombolPilih(
            name: 'Do\'a Harian',
            method: () => Get.toNamed(Routes.DOA),
          ),
          const SizedBox(
            height: 10,
          ),
          TombolPilih(
            name: 'Asmaul-Husna',
            method: () => Get.toNamed(Routes.ASMAUL_HUSNA),
          ),
          const SizedBox(
            height: 10,
          ),
          TombolPilih(
            name: 'Niat Sholat',
            method: () => Get.toNamed(Routes.NIAT_SHOLAT),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class TombolPilih extends StatelessWidget {
  TombolPilih({super.key, required this.name, required this.method});

  String name;
  final void Function() method;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: Get.width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: method,
          child: Text(
            name,
            style: const TextStyle(color: colorEmpat),
          ),
        ),
      ),
    );
  }
}
