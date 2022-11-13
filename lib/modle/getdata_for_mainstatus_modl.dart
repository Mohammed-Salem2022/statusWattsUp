


import 'package:cloud_firestore/cloud_firestore.dart';

class GetdataForMainStatusModle{

  String name;
  String imageUrl='empty';
  Timestamp time;

  GetdataForMainStatusModle(
      {
    required this.name,
    required this.imageUrl,
    required this.time
  }
  );
}