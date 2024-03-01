// ignore_for_file: must_be_immutable

import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/data/models/jadwal_sholat.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../widgets/jadwal.dart';
import '../../../../../../../../widgets/jarak.dart';
import '../controllers/jadwal_sholat_controller.dart';

class JadwalSholatView extends GetView<JadwalSholatController> {
  const JadwalSholatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String tanggal = DateFormat.yMMMMEEEEd('id').format(dateTime);
    String date = DateFormat('dd').format(dateTime);
    int fix = int.parse(date);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Jadwal Sholat',
            style: TextStyle(color: colorEmpat),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<JadwalSholat>(
          future: controller.getJadwalSholat(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: Text('Tidak ada data'),
              );
            }

            final data = snapshot.data!.prayers[fix - 1];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    color: colorDua,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              tanggal,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: colorEmpat,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    '${controller.kecamatan}, ${controller.kabupaten}, ${controller.provinsi}'),
                              ),
                            ],
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              Get.toNamed(Routes.DETAIL_JADWAL,
                                  arguments: snapshot.data!.prayers);
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: colorEmpat,
                            ),
                            label: const Text(
                              'Semua Jadwal',
                              style: TextStyle(color: colorEmpat),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: colorDua,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Jadwal(
                            nama: 'Imsak',
                            jam: data.time.imsak,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Subuh',
                            jam: data.time.subuh,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Terbit',
                            jam: data.time.terbit,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Dhuha',
                            jam: data.time.dhuha,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Dzuhur',
                            jam: data.time.dzuhur,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Ashar',
                            jam: data.time.ashar,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Maghrib',
                            jam: data.time.maghrib,
                          ),
                          const Jarak(),
                          Jadwal(
                            nama: 'Isya',
                            jam: data.time.isya,
                          ),
                          const Jarak(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
