import 'package:alquran/app/constants/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/niat_sholat_controller.dart';

class NiatSholatView extends GetView<NiatSholatController> {
  const NiatSholatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorEmpat),
        title: const Text(
          'Niat Sholat',
          style: TextStyle(color: colorEmpat),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getNiatSholat(),
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

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: colorDua,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/list_octagonal.png',
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data.number}',
                                      style: const TextStyle(
                                          fontSize: 13, color: colorEmpat),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    '${data.name.toString().capitalize}',
                                    style: const TextStyle(
                                        color: colorEmpat, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${data.arabic}',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: colorEmpat,
                              fontFamily: 'Arab',
                              fontSize: 30,
                              wordSpacing: 3),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width * 0.9,
                        child: Text(
                          textAlign: TextAlign.start,
                          '${data.latin}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width * 0.9,
                        child: Text(
                          'Artinya : ${data.translation}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
