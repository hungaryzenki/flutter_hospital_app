import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  //collection reference
  final CollectionReference userReference = Firestore.instance.collection('userInfo');
  final CollectionReference hospitalReference = Firestore.instance.collection('hospitalInfo');

}