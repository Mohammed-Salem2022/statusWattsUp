





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:status_wattsup/view/widget/home_page/main_menu.dart';
import 'package:status_wattsup/view_modle/controller_home_page.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import '../view_modle/darkmode/savedarkmodewithanimate.dart';
import '../view_modle/darkmode/them_controller.dart';
import '../view_modle/darkmode/themeapp.dart';
// class HomePage extends StatefulWidget {
//
//   @override
//   _HomePageState createState() => _HomePageState();
//
// }
//
// class _HomePageState extends State<HomePage> with WidgetsBindingObserver{
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar:  AppBar(
//
//           title: Text('حالات واتساب',
//             style: GoogleFonts.cairo(
//               fontSize: 20,
//               fontWeight: FontWeight.w600
//             ),
//
//           ),
//           centerTitle: true,
//           actions: [
//             GetBuilder<ControllerHomePage>(
//               init: ControllerHomePage(),
//               builder: (controller) {
//                return    IconButton(onPressed: (){
//                  ThemeDarkController().ChangeThemedark();
//                },
//                    icon: Icon(Get.isDarkMode?Icons.dark_mode: Icons.wb_sunny)
//                );
//             },)
//
//           ],
//         ),
//         body: mainMenu()
//     );
//   }
// }



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomePage>(
      init: ControllerHomePage(),
      builder: (controller) {
        return ThemeSwitchingArea(

          child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
           appBar:  AppBar(
             backgroundColor: Get.isDarkMode?Colors.grey:Colors.blueAccent,
                title: Text('حالات واتساب',
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),

                ),
                centerTitle: true,
                actions: [

                  animationthemedark()



                ],
              ),
            body: mainMenu()
          ),
        );
      }
    );
  }
}
Widget animationthemedark(){
   return          ThemeSwitcher.withTheme(
               builder: (context, switcher, theme) {
                   return      IconButton(onPressed: (){
                      ThemeSwitcher.of(context).changeTheme(
                       theme:Savedarkmodewithanimate().getThemeDarkFromstorgetheme()

                           ? themeApp.dark
                           : themeApp.light,

                           isReversed: Savedarkmodewithanimate().getThemeDarkFromstorgetheme() ? true : false,


                        // ThemeDarkController().ChangeThemedark()
                      );
                      Savedarkmodewithanimate().saveThemeDarkDatanimation(!Savedarkmodewithanimate().getThemeDarkFromstorgetheme());
                      // controller.update();
                     },
                       icon: Icon(Get.isDarkMode?Icons.dark_mode: Icons.wb_sunny,)
                     );
                      },

                     );
}
