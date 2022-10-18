

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsManger{
    //هنا نعمل كلاس للاعلانات
   static  const bool _textMode= true;
   static String get bannerAdUnitId{
     if(_textMode){
       // هنا علان تجريبي
       return  'ca-app-pub-3940256099942544/6300978111';
     }
     // هنا اعلان حقيقي
     else return '';

   }
   static String get InterstitialAds{

     if(_textMode){
       return 'ca-app-pub-3940256099942544/1033173712';
     }else return '';
   }
}