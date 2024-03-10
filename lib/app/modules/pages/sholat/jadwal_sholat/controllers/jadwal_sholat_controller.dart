import 'dart:convert';

import 'package:alquran/app/data/models/jadwal_sholat.dart';
import 'package:alquran/app/data/models/alamat.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

class JadwalSholatController extends GetxController {
  String? provinsi;
  String? kabupaten;
  String? kecamatan;

  // late BannerAd bannerAd;
  bool isLoad = false;

  Future<Position> getLocation() async {
    late bool serviceEnabled;
    late LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<JadwalSholat> getJadwalSholat() async {
    Position location = await getLocation();
    Alamat alamat = await getAlamat(
        location.latitude.toString(), location.longitude.toString());
    kecamatan = alamat.city;
    kabupaten = alamat.localityInfo!.administrative![2].name;
    provinsi = alamat.principalSubdivision;

    Uri url = Uri.parse(
        'https://waktu-sholat.vercel.app/prayer?latitude=${location.latitude}&longitude=${location.longitude}');
    var res = await http.get(url);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);
    return JadwalSholat.fromJson(data);
  }

  Future<Alamat> getAlamat(String lat, String lng) async {
    final url = Uri.parse(
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=$lat&longitude=$lng&localityLanguage=en');
    var res = await http.get(url);
    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);
    return Alamat.fromJson(data);
  }

  // initBannedAd() {
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: 'ca-app-pub-3940256099942544/9214589741',
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         isLoad = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //         print('gagal');
  //       },
  //     ),
  //     request: const AdRequest(),
  //   );

  //   bannerAd.load();
  // }

  @override
  void onInit() {
    super.onInit();
    // initBannedAd();
  }
}
