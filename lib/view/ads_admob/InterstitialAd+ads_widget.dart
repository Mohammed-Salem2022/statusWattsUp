

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:status_wattsup/modle/adsmanger.dart';
getadsInterstitialAds()async{
  DocumentReference getbanner=   FirebaseFirestore.instance.collection('admobe').doc('InterstitialAds');

  var d=await getbanner.get();
  return d['Interstitial'].toString();

}
class Interstitial_Ad{
  static  InterstitialAd? mInterstitialAd;
  static bool isReady=false;


  static void loadInterstitialAd()async{
    InterstitialAd.load(
        adUnitId:isReady?AdsManger.InterstitialAds:await getadsInterstitialAds(),
        request: AdRequest(nonPersonalizedAds: true),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){

                 mInterstitialAd=ad;

            },
            onAdFailedToLoad: (error ){}
        )
    );
  }
  static void showInterstitialAd(){

    mInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        print('ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        loadInterstitialAd();
      },
    );
    mInterstitialAd?.show();

  }

}