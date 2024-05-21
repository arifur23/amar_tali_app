import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessExpenseEntity{
  late String id;
  late String details;
  late String date;
  late int amount;

  BusinessExpenseEntity({
    required this.id,
    required this.details,
    required this.date,
    required this.amount
});

  BusinessExpenseEntity.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id = snapshot.id;
    date = (snapshot.data() as dynamic)['date'];
    details = (snapshot.data() as dynamic)['details'];
    amount = (snapshot.data() as dynamic)['amount'];
  }

  // factory BusinessExpenseEntity.fromJson(Map<String, dynamic> json ) => _$BusinessExpenseEntityFromJson(json);

  // factory BusinessExpenseEntity.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$BusinessExpenseEntityFromJson(json);
  // }

}

class BusinessExpenseEntities{
  String next;
  int entries;
  List<BusinessExpenseEntity> businessExpenseEntities;

  BusinessExpenseEntities({
    required this.next,
    required this.entries,
    required this.businessExpenseEntities
  });

  // factory BusinessExpenseEntities.fromJson(Map<String, dynamic> json ) => _$BusinessExpenseEntitiesFromJson(json);

  // factory BusinessExpenseEntities.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$BusinessExpenseEntitiesFromJson(json);
  // }

}

