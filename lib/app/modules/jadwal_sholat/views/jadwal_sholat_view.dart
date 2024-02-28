import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_sholat_controller.dart';

class JadwalSholatView extends GetView<JadwalSholatController> {
  const JadwalSholatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JadwalSholatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JadwalSholatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
