





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_wattsup/view/widget/home_page/main_menu.dart';
import 'package:status_wattsup/view_modle/controller_home_page.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(

          title: Text('حالات واتساب',
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),

          ),
          centerTitle: true,
        ),
        body: mainMenu()
    );
  }
}



// class HomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:  AppBar(
//
//         title: Text('حالات'),
//         centerTitle: true,
//       ),
//       body: mainMenu()
//     );
//   }
// }
