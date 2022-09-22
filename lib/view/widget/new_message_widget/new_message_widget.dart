
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_wattsup/view_modle/controller_new_message.dart';
class NewMessage_Widget  extends StatelessWidget {
  String newmessage;
  NewMessage_Widget({
    Key? key,
    required this.newmessage,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerNewMessage>(
      init: ControllerNewMessage(),
      builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          color: Colors.white,

          child: Container(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [

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


                        ),
                      ],
                    ),
                    Text(newmessage,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                    Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              FlutterClipboard.copy(newmessage).then((value) {
                                Get.snackbar(
                                  'نسخ',
                                  newmessage,
                                  backgroundColor: Colors.blue,
                                  colorText:       Colors.white,
                                  snackPosition:   SnackPosition.BOTTOM,

                                );

                              });
                            },
                            icon:Icon( Icons.copy)
                        ),
                        IconButton(
                            onPressed: () async{
                              await  Share.share(newmessage);
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
    },);
  }
}

