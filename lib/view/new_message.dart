

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';
import 'package:status_wattsup/view/widget/new_message_widget/new_message_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../view_modle/controller_new_message.dart';
class NewMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,

          title: Text(
            'كلمات جديدة',
            style: GoogleFonts.arefRuqaa(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
            ),
          ),

        ),
        body: GetBuilder<ControllerNewMessage>(
          init: ControllerNewMessage(),
          builder: (controller) {
            return StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('all').snapshots(),
              builder:(context, snapshot) {

                if(snapshot.connectionState==ConnectionState.waiting){

                  return const Center(
                    child: CircularProgressIndicator(
                        color: Colors.blue,
                        strokeWidth: 2
                    ),
                  );

                }

                else if(snapshot.hasData==null){
                  return const Center(
                    child: Text(
                      'اعمل اعاده تحديث',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder:(context, index) {
                    Timestamp timestamp=snapshot.data!.docs[index]['time'];
                    String timeago2 = timeago.format(timestamp.toDate(),locale: 'en_short');
                    return  controller.gettimeago(timeago2)?
                    NewMessage_Widget(newmessage: snapshot.data!.docs[index]['message']):Container();
                  },
                );

              },
            );

          },)
    );
  }
}
