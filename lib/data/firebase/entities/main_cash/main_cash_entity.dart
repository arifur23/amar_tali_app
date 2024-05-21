import 'package:cloud_firestore/cloud_firestore.dart';

class MainCashEntity {
  MainCashEntity({
    required this.id,
    required this.amount,
    required this.date,
  });

  late String id;
  late int amount;
  late String date;

  MainCashEntity.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id = snapshot.id;
    amount = (snapshot.data() as dynamic)['amount'];
    date = (snapshot.data() as dynamic)['date'];
  }
}