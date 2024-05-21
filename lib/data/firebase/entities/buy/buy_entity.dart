import 'package:cloud_firestore/cloud_firestore.dart';

class BuyEntity{
  BuyEntity({
    required this.id,
    required this.details,
    required this.amount,
    required this.date,
  });
  late String id;
  late String details;
  late int amount;
  late String date;

  BuyEntity.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id = snapshot.id;
    details = (snapshot.data() as dynamic)['details'];
    amount = (snapshot.data() as dynamic)['amount'];
    date = (snapshot.data() as dynamic)['date'];
  }

  // factory BuyEntity.fromJson(Map<String, dynamic> json ) => _$BuyEntityFromJson(json);

  // factory BuyEntity.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$BuyEntityFromJson(json);
  // }

}


class BuyEntities{
  BuyEntities({
    required this.next,
    required this.entries,
    required this.buyEntities
});

  String next;
  int entries;
  List<BuyEntity> buyEntities;
  //
  // factory BuyEntities.fromJson(Map<String, dynamic> json ) => _$BuyEntitiesFromJson(json);

  // factory BuyEntities.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$BuyEntitiesFromJson(json);
  // }

}
