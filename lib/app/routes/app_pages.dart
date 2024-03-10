import 'package:get/get.dart';

import '../modules/bottom_bar/bindings/bottom_bar_binding.dart';
import '../modules/bottom_bar/views/bottom_bar_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/pages/alquran/detail_juz/bindings/detail_juz_binding.dart';
import '../modules/pages/alquran/detail_juz/views/detail_juz_view.dart';
import '../modules/pages/alquran/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/pages/alquran/detail_surah/views/detail_surah_view.dart';
import '../modules/pages/alquran/home/bindings/home_binding.dart';
import '../modules/pages/alquran/home/views/home_view.dart';
import '../modules/pages/alquran/last_read/bindings/last_read_binding.dart';
import '../modules/pages/alquran/last_read/views/last_read_view.dart';
import '../modules/pages/doa/asmaul_husna/bindings/asmaul_husna_binding.dart';
import '../modules/pages/doa/asmaul_husna/views/asmaul_husna_view.dart';
import '../modules/pages/doa/doa/bindings/doa_binding.dart';
import '../modules/pages/doa/doa/views/doa_view.dart';
import '../modules/pages/doa/doa_harian/bindings/doa_harian_binding.dart';
import '../modules/pages/doa/doa_harian/views/doa_harian_view.dart';
import '../modules/pages/doa/niat_sholat/bindings/niat_sholat_binding.dart';
import '../modules/pages/doa/niat_sholat/views/niat_sholat_view.dart';
import '../modules/pages/sholat/detail_jadwal/bindings/detail_jadwal_binding.dart';
import '../modules/pages/sholat/detail_jadwal/views/detail_jadwal_view.dart';
import '../modules/pages/sholat/jadwal_sholat/bindings/jadwal_sholat_binding.dart';
import '../modules/pages/sholat/jadwal_sholat/views/jadwal_sholat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => const DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.LAST_READ,
      page: () => const LastReadView(),
      binding: LastReadBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_JUZ,
      page: () => const DetailJuzView(),
      binding: DetailJuzBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_SHOLAT,
      page: () => const JadwalSholatView(),
      binding: JadwalSholatBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_JADWAL,
      page: () => const DetailJadwalView(),
      binding: DetailJadwalBinding(),
    ),
    GetPage(
      name: _Paths.DOA_HARIAN,
      page: () => const DoaHarianView(),
      binding: DoaHarianBinding(),
    ),
    GetPage(
      name: _Paths.DOA,
      page: () => const DoaView(),
      binding: DoaBinding(),
    ),
    GetPage(
      name: _Paths.ASMAUL_HUSNA,
      page: () => const AsmaulHusnaView(),
      binding: AsmaulHusnaBinding(),
    ),
    GetPage(
      name: _Paths.NIAT_SHOLAT,
      page: () => const NiatSholatView(),
      binding: NiatSholatBinding(),
    ),
  ];
}
