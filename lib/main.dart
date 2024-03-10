import 'package:alquran/app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/routes/app_pages.dart';

// AppOpenAd? appOpenAd;

// loadAppOpenAd() {
//   AppOpenAd.load(
//       adUnitId:
//           'ca-app-pub-3940256099942544/9257395921', //Your ad Id from admob
//       request: const AdRequest(),
//       adLoadCallback: AppOpenAdLoadCallback(
//           onAdLoaded: (ad) {
//             appOpenAd = ad;
//             appOpenAd!.show();
//           },
//           onAdFailedToLoad: (error) {}),
//       orientation: AppOpenAd.orientationPortrait);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();
  // loadAppOpenAd();

  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: ['828E3489D0D5771F4829C56C6369E1E1']);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', '');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      title: "Baca Al-Qur'an",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
    ),
  );
}
