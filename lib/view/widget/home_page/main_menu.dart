






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_wattsup/view/status_page_screen.dart';
import 'package:status_wattsup/view_modle/controller_home_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../modle/getdata_for_mainstatus_modl.dart';
import '../../new_message.dart';
class mainMenu extends StatelessWidget {
final controllerhomepage=Get.put(ControllerHomePage());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          //here desgin New World
          desginNewMessage(context),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('addstatus').snapshots(),
              builder: (context, snapshot) {
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
                return GridView.builder(
                  itemCount:snapshot.data!.docs.length ,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 10,
                      childAspectRatio:6.5/8,
                      crossAxisSpacing: 10
                  ),
                  itemBuilder: (context, index) {
                    GetdataForMainStatusModle getdataForMainStatusModle=GetdataForMainStatusModle(
                        imageUrl: snapshot.data!.docs[index]['imageUrl'],
                        name:  snapshot.data!.docs[index]['name'],
                        time:  snapshot.data!.docs[index]['time']
                    );
                    return main2(
                      getdataForMainStatusModle:getdataForMainStatusModle,
                    );
                  },
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
class main2 extends StatelessWidget {
  GetdataForMainStatusModle getdataForMainStatusModle;
  main2({
    Key? key,
    required this.getdataForMainStatusModle
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomePage>(
      init: ControllerHomePage(),
      builder: (controller) {
        String timeago2 = timeago.format(getdataForMainStatusModle.time.toDate(),locale: 'en_short');
        return   GestureDetector(
          onTap: (){

            Get.to( () => StatusPageScren(),arguments:getdataForMainStatusModle.name);


          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(

                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)
                    )
                ),
                child:Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                        Image.network(
                          getdataForMainStatusModle.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(

                                Radius.circular(10)
                            )
                        ),

                      ),
                      Center(
                          child:   Text(
                            getdataForMainStatusModle.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold

                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                            controller.gettimeago(timeago2)?   Text(
                              'جديد',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                  color: Colors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600

                              ),
                            ):Container(),

                          ],
                        ),
                      ),

                    ]
                )

            ),
          ),
        );
      },
    );
  }
}
Widget desginNewMessage(BuildContext context){
  return SingleChildScrollView(
    child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Get.to(()=>NewMessage() );

                },
                child: Container(

                    width: MediaQuery.of(context).size.width*0.45,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child:Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('image/newmessage.jpg',fit: BoxFit.cover),

                        ) ,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54

                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Icon(Icons.fiber_new,size: 50,color: Colors.white,),
                              Text('كلمات جديدة',
                                style: GoogleFonts.arefRuqaa(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                        )

                      ],

                    )
                ),
              ),
            ),
          ],
        ),
  );

}