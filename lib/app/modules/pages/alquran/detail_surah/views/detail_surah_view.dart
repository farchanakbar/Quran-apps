import 'package:alquran/app/data/models/detail_surah.dart' as detail;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../../constants/color.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find<HomeController>();
    Map<String, dynamic>? bookmark;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorEmpat),
        title: Text(
          'Surah ${Get.arguments['name']}',
          style: const TextStyle(color: colorEmpat),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<detail.DetailSurah>(
        future: controller.getDetailSurah(Get.arguments['number'].toString()),
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

          if (Get.arguments['bookmark'] != null) {
            bookmark = Get.arguments['bookmark'];
            if (bookmark!['index_ayat'] > 1) {
              controller.autoScrollC.scrollToIndex(bookmark!['index_ayat'] + 1,
                  preferPosition: AutoScrollPosition.begin);
            }
          }

          print(bookmark);
          final detail.DetailSurah data = snapshot.data!;
          List<Widget> allAyat =
              List.generate(snapshot.data?.verses?.length ?? 0, (index) {
            final ayat = snapshot.data?.verses?[index];
            return AutoScrollTag(
              key: ValueKey(index + 1),
              index: index + 1,
              controller: controller.autoScrollC,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      color: colorDua,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  '${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 13, color: colorEmpat),
                                ),
                              ),
                            ),
                            GetBuilder<DetailSurahController>(
                              builder: (c) {
                                return Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          backgroundColor: colorDua,
                                          title: 'Penanda Bacaan',
                                          titleStyle: const TextStyle(
                                              color: colorEmpat, fontSize: 20),
                                          middleText:
                                              'Pilih Jenis Penanda Bacaan',
                                          middleTextStyle: const TextStyle(
                                              color: colorEmpat, fontSize: 18),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  await c.addBookmark(
                                                      true,
                                                      snapshot.data!,
                                                      ayat!,
                                                      index);
                                                  homeC.update();
                                                },
                                                child: const Text(
                                                    'Terakhir Dibaca')),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  await c.addBookmark(
                                                      false,
                                                      snapshot.data!,
                                                      ayat!,
                                                      index);
                                                  homeC.update();
                                                },
                                                child: const Text(
                                                    'Tandai Bacaan')),
                                          ],
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.bookmark_add_outlined,
                                        color: colorEmpat,
                                      ),
                                    ),
                                    (ayat?.kondisiAudio == 'stop')
                                        ? ayat?.isLoading == true
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    right: 20),
                                                height: 18,
                                                width: 18,
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: colorEmpat,
                                                ),
                                              )
                                            : IconButton(
                                                onPressed: () {
                                                  c.audioPlayers(ayat);
                                                },
                                                icon: const Icon(
                                                  Icons.play_arrow,
                                                  color: colorEmpat,
                                                ),
                                              )
                                        : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              (ayat?.kondisiAudio == 'playing')
                                                  ? IconButton(
                                                      onPressed: () {
                                                        c.pauseAudio(ayat!);
                                                      },
                                                      icon: const Icon(
                                                        Icons.pause,
                                                        color: colorEmpat,
                                                      ),
                                                    )
                                                  : IconButton(
                                                      onPressed: () {
                                                        c.resumeAudio(ayat!);
                                                      },
                                                      icon: const Icon(
                                                        Icons.play_arrow,
                                                        color: colorEmpat,
                                                      ),
                                                    ),
                                              IconButton(
                                                onPressed: () {
                                                  c.stopAudio(ayat!);
                                                },
                                                icon: const Icon(
                                                  Icons.stop,
                                                  color: colorEmpat,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${ayat?.text?.arab}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Arab',
                        wordSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Text(
                        'Artinya : ${ayat?.translation?.id}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            );
          });

          return ListView(
            controller: controller.autoScrollC,
            children: [
              AutoScrollTag(
                key: const ValueKey(0),
                index: 0,
                controller: controller.autoScrollC,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: colorDua,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${data.name?.transliteration?.id}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: colorEmpat,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${data.name?.short}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: colorEmpat,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${data.name?.translation?.id}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            height: 1,
                            width: Get.width * 0.9,
                            color: colorEmpat,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${data.numberOfVerses} Ayat',
                                textAlign: TextAlign.center,
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title:
                                          'Tafsir ${data.name?.transliteration?.id}',
                                      titleStyle: const TextStyle(
                                        color: colorEmpat,
                                      ),
                                      backgroundColor: colorDua,
                                      content: Text(
                                        '${data.tafsir?.id}',
                                        textAlign: TextAlign.start,
                                      ));
                                },
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: colorEmpat,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ...allAyat
            ],
          );
        },
      ),
    );
  }
}
