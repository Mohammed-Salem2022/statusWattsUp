


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../modle/adsmanger.dart';
import 'darkmode/them_controller.dart';

class ControllerHomePage extends GetxController with WidgetsBindingObserver{
  BannerAd? bannerAd;
  bool isAdReady=false;
  bool testMode=false;
  AdSize adSize=AdSize.banner;
  List list=['now','1m','2m','3m','4m','5m','6m','7m','8m','9m','10m','11m','12m','13m','14m','15m','16m','17m','18m','19m','20m','21m','22m','23m','24m','25m','26m','27m','28m','29m','30m','31m','32m','33m','34m','35m','36m','37m','38m','39m','40m','41m','42m','43m','44m','45m','46m','47m','48m','49m','50m','51m','52m','53m','54m','55m','56m','57m','58m','59m','~1h','2h',
    '3h','4h','5h','6h','7h','8h','9h','10h','11h','12h','13h','14h','15h','16h','17h','18h','19h','20h','21h','22h','23h','24h','~1d','2d','3d','4d','5d','6d','7d','8d','9d','10d','10d','11d','12d','13d','14d','15d','16d','17d','18d','19d','20d',

  ];
  bool gettimeago(String timeago){
    //هنا حتى نجيب الوقت بدقايق مثال 4m or 5m or h1
    for(var f in list){
      if(f==timeago){
        return true;
      }

    }
    return false;
  }

  //here ready ads admobe

    getAdsbannerFromAdmob()async{
   DocumentReference getbanner=   FirebaseFirestore.instance.collection('admobe').doc('banner');

    var d=await getbanner.get();
     return d['bannerAds'].toString();

  }

  void createbannerAd()async{
    bannerAd=BannerAd(
        size: adSize,
        adUnitId:testMode? AdsManger.bannerAdUnitId:await getAdsbannerFromAdmob(),//'ca-app-pub-3940256099942544/6300978111',
        listener: BannerAdListener(
            onAdLoaded: (ad){
              isAdReady=true;
              update();
            },
          onAdFailedToLoad: (ad, error){
              print('Ads faild to upload ${error.message}');
              update();
          }
        ),
        request: const AdRequest()
    );
    bannerAd?.load();


  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed from background"); //you can add your codes here
        //
        update();
        break;
      case AppLifecycleState.inactive:
        print("app is in inactive state");
        //
        update();
        break;
      case AppLifecycleState.paused:
        print("app is in paused state");
        break;
      case AppLifecycleState.detached:
        print("app has been removed");
        break;
    }
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    createbannerAd();
    WidgetsBinding.instance.addObserver(this);
    print(await getAdsbannerFromAdmob());
    print(ThemeDarkController().thememode);
    print('jjjjjjjjjjjjjjjjjjjjjjjjj');
    print(ThemeDarkController(). getThemeDarkFromstorgetheme());
    print('jjjjjjjjjjjjjjjjjjjjjjjjj');

  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    bannerAd?.dispose();

  }
}
