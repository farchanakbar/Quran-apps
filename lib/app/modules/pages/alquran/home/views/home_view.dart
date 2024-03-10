import 'package:alquran/app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Al-Qur\'an Indonesia',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              GetBuilder<HomeController>(
                builder: (c) {
                  return FutureBuilder<Map<String, dynamic>?>(
                    future: c.getLastRead(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorDua,
                            gradient: const LinearGradient(
                              colors: [
                                colorDua,
                                colorTiga,
                              ],
                            ),
                          ),
                          child: SizedBox(
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: -30,
                                  right: 0,
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: SizedBox(
                                      width: 180,
                                      height: 180,
                                      child: Image.asset(
                                        'assets/images/quran.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.menu_book_rounded,
                                            color: colorEmpat,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Terakhir dibaca',
                                            style: TextStyle(
                                              color: colorEmpat,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                          color: colorEmpat,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                          color: colorEmpat,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                          color: colorEmpat,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      Map<String, dynamic>? lastRead = snapshot.data;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorDua,
                          gradient: const LinearGradient(
                            colors: [
                              colorDua,
                              colorTiga,
                            ],
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onLongPress: () {
                              if (lastRead != null) {
                                Get.defaultDialog(
                                  backgroundColor: colorDua,
                                  title: 'Hapus Terakhir Dibaca',
                                  titleStyle: const TextStyle(
                                      color: colorEmpat, fontSize: 20),
                                  middleText: 'apakah yakin mau dihapus?',
                                  middleTextStyle: const TextStyle(
                                      color: colorEmpat, fontSize: 18),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Tidak')),
                                    ElevatedButton(
                                        onPressed: () {
                                          c.deleteBookmark(lastRead['id']);
                                          Get.back();
                                        },
                                        child: const Text('Hapus'))
                                  ],
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              switch (lastRead!['via']) {
                                case 'juz':
                                  Get.toNamed(Routes.DETAIL_JUZ, arguments: {
                                    'juz': lastRead['juz'] - 1 as dynamic,
                                    'bookmark': lastRead,
                                  });
                                  break;
                                default:
                                  Get.toNamed(Routes.DETAIL_SURAH, arguments: {
                                    'name': lastRead['surah']
                                        .toString()
                                        .replaceAll('+', "'"),
                                    'number': lastRead['number_surah'],
                                    'bookmark': lastRead,
                                  });
                                  break;
                              }
                            },
                            child: SizedBox(
                              height: 150,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -30,
                                    right: 0,
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: SizedBox(
                                        width: 180,
                                        height: 180,
                                        child: Image.asset(
                                          'assets/images/quran.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.menu_book_rounded,
                                              color: colorEmpat,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Terakhir dibaca',
                                              style: TextStyle(
                                                color: colorEmpat,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          lastRead != null
                                              ? lastRead['via'] == 'juz'
                                                  ? 'Nomor ${lastRead['surah']}'
                                                  : lastRead['surah']
                                                      .toString()
                                                      .replaceAll('+', "'")
                                              : '',
                                          style: const TextStyle(
                                            color: colorEmpat,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          lastRead == null
                                              ? 'belum ada data'
                                              : 'Ayat ${lastRead['ayat']} | Juz ${lastRead['juz']}',
                                          style: const TextStyle(
                                            color: colorEmpat,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          lastRead == null
                                              ? ''
                                              : 'Via ${lastRead['via']}',
                                          style: const TextStyle(
                                            color: colorEmpat,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const TabBar(
                labelColor: colorEmpat,
                indicatorColor: colorEmpat,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Surah',
                  ),
                  Tab(
                    text: 'Juz',
                  ),
                  Tab(
                    text: 'Ditandai',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text(
                              'Tidak ada data',
                              style: TextStyle(color: colorEmpat),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_SURAH,
                                        arguments: {
                                          'name':
                                              surah.name!.transliteration!.id,
                                          'number': surah.number!,
                                        });
                                  },
                                  leading: Container(
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
                                        '${surah.number}',
                                        style: const TextStyle(
                                            fontSize: 13, color: colorEmpat),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    '${surah.name!.transliteration!.id}',
                                    style: const TextStyle(color: colorEmpat),
                                  ),
                                  subtitle: Text(
                                    '${surah.numberOfVerses} ayat | ${surah.revelation?.id ?? 'eroor'}',
                                    style: const TextStyle(color: colorEmpat),
                                  ),
                                  trailing: Text(
                                    '${surah.name?.short}',
                                    style: const TextStyle(
                                        fontSize: 18, color: colorEmpat),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.black,
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_JUZ,
                                  arguments: {
                                    'juz': index,
                                  },
                                );
                              },
                              leading: Container(
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
                              title: Text(
                                'Juz ${index + 1}',
                                style: const TextStyle(color: colorEmpat),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.black,
                            )
                          ],
                        );
                      },
                    ),
                    GetBuilder<HomeController>(
                      builder: (c) {
                        return FutureBuilder<List<Map<String, dynamic>>>(
                          future: c.getBookmark(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text('Tidak ada bookmark'),
                              );
                            }

                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data =
                                    snapshot.data![index];
                                return ListTile(
                                  onTap: () {
                                    switch (data['via']) {
                                      case 'juz':
                                        Get.toNamed(Routes.DETAIL_JUZ,
                                            arguments: {
                                              'juz': data['juz'] - 1 as dynamic,
                                              'bookmark': data,
                                            });
                                        break;
                                      default:
                                        Get.toNamed(Routes.DETAIL_SURAH,
                                            arguments: {
                                              'name': data['surah']
                                                  .toString()
                                                  .replaceAll('+', "'"),
                                              'number': data['number_surah'],
                                              'bookmark': data,
                                            });
                                        break;
                                    }
                                  },
                                  leading: Container(
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
                                  leadingAndTrailingTextStyle:
                                      const TextStyle(color: colorEmpat),
                                  title: data['via'] == 'juz'
                                      ? Text(
                                          'Ayat ${data['surah'].toString().replaceAll("+", "'")}')
                                      : Text(
                                          'Surah ${data['surah'].toString().replaceAll("+", "'")}'),
                                  titleTextStyle:
                                      const TextStyle(color: colorEmpat),
                                  subtitle: data['via'] == 'juz'
                                      ? Text(
                                          'juz ${data['juz']}, via ${data['via']}')
                                      : Text(
                                          'ayat ${data['ayat']}, juz ${data['juz']}, via ${data['via']}'),
                                  subtitleTextStyle:
                                      const TextStyle(color: colorEmpat),
                                  trailing: IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          backgroundColor: colorDua,
                                          title: 'Hapus Penanda',
                                          titleStyle: const TextStyle(
                                              color: colorEmpat, fontSize: 20),
                                          middleText: 'Hapus Penanda Bacaan?',
                                          middleTextStyle: const TextStyle(
                                              color: colorEmpat, fontSize: 18),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  Get.back();
                                                },
                                                child: const Text('Tidak')),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  c.deleteBookmark(data['id']);
                                                },
                                                child: const Text('Hapus')),
                                          ],
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever,
                                        color: colorEmpat,
                                      )),
                                );
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
