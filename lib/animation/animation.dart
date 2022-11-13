




import 'package:flutter/cupertino.dart';

class SlideRight1 extends PageRouteBuilder{
  final Page;
  SlideRight1({required this.Page}):super(pageBuilder: (context,animation,animationtwo)=>Page,
      transitionsBuilder:  (context,animation,animationtwo,child){
        var begin =   Offset(1,0);
        var end   =   Offset.zero;
        var tween=Tween(begin: begin,end: end);
        var tweenSlideTransition=Tween(begin:begin,end: end);
        var curvenanimation=CurvedAnimation(parent: animation, curve: Curves.linear);
        return  SlideTransition(position: tweenSlideTransition.animate(curvenanimation),child: child,);



      }
  );


}