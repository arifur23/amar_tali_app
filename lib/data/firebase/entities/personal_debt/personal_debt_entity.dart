import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalDebtEntity{
  late String id;
  late String details;
  late int amount;
  late String date;
  late bool isGet;
  late String whom;

  PersonalDebtEntity({
    required this.id,
    required this.details,
    required this.amount,
    required this.whom,
    required this.isGet,
    required this.date
  });

  PersonalDebtEntity.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id = snapshot.id;
    details = (snapshot.data() as dynamic)['details'];
    amount = (snapshot.data() as dynamic)['amount'];
    whom = (snapshot.data() as dynamic)['whom'];
    isGet = (snapshot.data() as dynamic)['isGet'];
    date = (snapshot.data() as dynamic)['date'];
  }

  // factory PersonalDebtEntity.fromJson(Map<String, dynamic> json ) => _$PersonalDebtEntityFromJson(json);

  // factory PersonalDebtEntity.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$PersonalDebtEntityFromJson(json);
  // }

}


class PersonalDebtEntities{
  String next;
  int entries;
  List<PersonalDebtEntity> personalDebtEntities;

  PersonalDebtEntities({
    required this.next,
    required this.entries,
    required this.personalDebtEntities
  });

   // factory PersonalDebtEntities.fromJson(Map<String, dynamic> json ) => _$PersonalDebtEntitiesFromJson(json);

  // factory PersonalDebtEntities.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$PersonalDebtEntitiesFromJson(json);
  // }

}