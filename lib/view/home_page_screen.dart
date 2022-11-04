





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_wattsup/view/widget/aa.dart';
import 'package:status_wattsup/view/widget/home_page/main_menu.dart';
import 'package:status_wattsup/view_modle/controller_home_page.dart';

import '../view_modle/darkmode/them_controller.dart';
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
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
         appBar:  AppBar(

              title: Text('حالات واتساب',
                style: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),

              ),
              centerTitle: true,
              actions: [



                      IconButton(onPressed: (){

                       ThemeDarkController().ChangeThemedark();
                      // controller.update();
                   },
                       icon: Icon(Get.isDarkMode?Icons.dark_mode: Icons.wb_sunny,)
                   ),

              ],
            ),
          body: mainMenu()
        );
      }
    );
  }
}
