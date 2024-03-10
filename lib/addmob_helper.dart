import 'package:google_mobile_ads/google_mobile_ads.dart';

class AddMobHelper {
  late RewardedAd rewardedAd;
  late BannerAd bannerAd;
  bool isLoad = false;

  initBannedAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/9214589741',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isLoad = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('gagal');
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          //
        },
      ),
    );
  }

  void showRewardedAd() async {
    await loadRewardedAd();
    rewardedAd.show(
      onUserEarnedReward: (ad, reward) {
        print('${reward.amount}');
      },
    );

    rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {},
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
      },
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
      },
      onAdImpression: (ad) {
        print('$ad');
      },
    );
  }
}
