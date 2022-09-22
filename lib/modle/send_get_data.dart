


import 'package:cloud_firestore/cloud_firestore.dart';

class Send_get_data{
  String  message;
  int index;
  String id;
  int favorite;
  Timestamp timestamp;
  Send_get_data({
    required this.message,
    required this.index,
    required this.id,
    required this.favorite,
    required this.timestamp,
  });
}