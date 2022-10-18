



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:status_wattsup/modle/adsmanger.dart';
import 'package:status_wattsup/view_modle/controller_home_page.dart';
class AdBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomePage>(
      init: ControllerHomePage(),
      builder: (controller) {
     return controller.isAdReady? Container(
        width:controller.adSize.width.toDouble() ,
       height: controller.adSize.height.toDouble(),
       child: AdWidget(ad: controller.bannerAd!,)
     ):Container();
    },);
  }
}
