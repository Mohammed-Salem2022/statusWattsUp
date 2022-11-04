

import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_wattsup/view/ads_admob/InterstitialAd+ads_widget.dart';
import 'package:status_wattsup/view_modle/controller_status_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../modle/send_get_data.dart';
class  ListStatus extends StatelessWidget {
  String namestatus;

  Send_get_data getdatafirbase;
  ListStatus({
    Key? key,
    required this.getdatafirbase,
    required this.namestatus
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String timeago2 = timeago.format(getdatafirbase.timestamp.toDate(),locale: 'en_short');
    return GetBuilder<ControllerStatusPage>(
      init: ControllerStatusPage(),
        builder: (controller) {
         return     Padding(
         padding: const EdgeInsets.all(8.0),
         child: Card(
         elevation: 2,
         color:  Get.isDarkMode?Colors.black38:Colors.white,

         child: Container(

         child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(

         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           Row(
             children: [
               controller.gettimeago(timeago2)?
               Container(

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: Colors.red,
                   ),
                   child:   Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: Text('الجديد',

                       style:TextStyle (
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 15
                       ),
                     ),
                   )


               ):Container(),
             ],
           ),
         Text(getdatafirbase.message,
         textAlign: TextAlign.right,
         style: GoogleFonts.cairo(
         color: Get.isDarkMode?Colors.white:Colors.black,
         fontWeight: FontWeight.w500,
         fontSize: 20
           ),

          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),

          Row(
            children: [
              IconButton(
                onPressed: (){

                   Interstitial_Ad.loadInterstitialAd();
                   FlutterClipboard.copy(getdatafirbase.message).then((value) {
                   controller.countAds++;
                   // print(controller. countAds.toString());
                   // print('2222222222222222222222222222222222');
                   Get.snackbar(
                       'نسخ',
                     getdatafirbase. message,
                       backgroundColor: Colors.blue,
                       colorText:       Colors.white,
                       snackPosition:   SnackPosition.BOTTOM,

                   );
                   if(controller. countAds==2){
                     controller.  countAds=0;
                         Interstitial_Ad.showInterstitialAd();
                   }


                 });
               },
               icon:Icon( Icons.copy)
             ),
            IconButton(
             onPressed: () async{
              await  Share.share(getdatafirbase.message);
             },
              icon:Icon( Icons.share)
            ),
            ],
         )
        ],
            ),
            )
        ),
             ),
        );
     },
         );
       }
}
