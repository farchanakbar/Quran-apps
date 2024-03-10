import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/data/models/jadwal_sholat.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tidak ada data'),
                    Text('Aktifkan Lokasi!'),
                  ],
                ),
              );
            }

            final data = snapshot.data!.prayers[fix - 1];
            return ListView(children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // controller.isLoad
                    //     ? SizedBox(
                    //         height: controller.bannerAd.size.height.toDouble(),
                    //         width: controller.bannerAd.size.width.toDouble(),
                    //         child: AdWidget(ad: controller.bannerAd),
                    //       )
                    //     : const SizedBox(),
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
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: colorEmpat,
                                ),
                                Expanded(
                                  child: Text(
                                      '${controller.kecamatan}, ${controller.kabupaten}, ${controller.provinsi}'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ]);
          },
        ));
  }
}
