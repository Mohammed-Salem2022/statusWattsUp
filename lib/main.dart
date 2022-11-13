

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:status_wattsup/view/home_page_screen.dart';
import 'package:status_wattsup/view_modle/darkmode/savedarkmodewithanimate.dart';
import 'package:status_wattsup/view_modle/darkmode/them_controller.dart';
import 'package:status_wattsup/view_modle/darkmode/themeapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This view.widget is the root of your application...
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: themeApp.light,
      builder: (p0, theme) {
       return   GetMaterialApp(
           debugShowCheckedModeBanner: false,
           title: 'حالات واتس اب',
           theme:Savedarkmodewithanimate().getThemeDarkFromstorgetheme()?themeApp.dark:themeApp.light,
           darkTheme: themeApp.dark ,
        //   themeMode: ThemeDarkController().thememode,
           initialRoute: '/',
           getPages:[

             GetPage(name:'/' , page:()=>  HomePage() )
           ]
       );
      },

    );
  }
}


