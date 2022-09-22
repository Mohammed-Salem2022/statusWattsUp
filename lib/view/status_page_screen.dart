





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_wattsup/view/widget/status_page/liststatus_widget.dart';
import 'package:status_wattsup/view_modle/controller_status_page.dart';

import '../modle/send_get_data.dart';
class StatusPageScren extends StatelessWidget {
  final c=Get.put(ControllerStatusPage());
   var getdata=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          getdata,
          style: GoogleFonts.cairo(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white
        ),
        ),

      ),
        body: GetBuilder<ControllerStatusPage>(
          init: ControllerStatusPage(),
          builder: (controller) {
            return StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('all').where('kind',isEqualTo: getdata).snapshots(),
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
                      final getdatafirbase=Send_get_data(
                        id:snapshot.data!.docs[index]['id'],
                        timestamp:snapshot.data!.docs[index]['time'] ,
                        index: index,
                        message: snapshot.data!.docs[index]['message'],
                        favorite:  snapshot.data!.docs[index]['favorite'],
                      );
                      return  ListStatus(

                        getdatafirbase: getdatafirbase,
                        namestatus: getdata,
                      );
                    },
                );

                },
            );

        },)
    );
  }
}
