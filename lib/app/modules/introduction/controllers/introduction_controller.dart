import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class IntroductionController extends GetxController {
  // //TODO: Implement IntroductionController
  // late BannerAd bannerAd;
  // bool isLoad = false;

  // initBannedAd() {
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: 'ca-app-pub-3940256099942544/6300978111',
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

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   initBannedAd();
  // }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('keluar');
  }
}
