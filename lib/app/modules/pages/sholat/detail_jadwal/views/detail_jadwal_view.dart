import 'package:alquran/app/data/models/jadwal_sholat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../widgets/jadwal.dart';
import '../../../../../../../../widgets/jarak.dart';
import '../../../../../constants/color.dart';
import '../controllers/detail_jadwal_controller.dart';

class DetailJadwalView extends GetView<DetailJadwalController> {
  const DetailJadwalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Prayers> data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorEmpat),
        title: const Text(
          'Semua Jadwal Sholat',
          style: TextStyle(color: colorEmpat),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final fullData = data[index];
          String dateString = fullData.date;
          DateFormat format = DateFormat("yyyy-MM-dd");
          DateTime dateTime = format.parse(dateString);
          String date = DateFormat.yMMMMEEEEd('id').format(dateTime);
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Card(
                  color: colorDua,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          date,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Jadwal(
                          nama: 'Imsak',
                          jam: fullData.time.imsak,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Subuh',
                          jam: fullData.time.subuh,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Terbit',
                          jam: fullData.time.terbit,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Dhuha',
                          jam: fullData.time.dhuha,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Dzuhur',
                          jam: fullData.time.dzuhur,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Ashar',
                          jam: fullData.time.ashar,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Maghrib',
                          jam: fullData.time.maghrib,
                        ),
                        const Jarak(),
                        Jadwal(
                          nama: 'Isya',
                          jam: fullData.time.isya,
                        ),
                        const Jarak(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
