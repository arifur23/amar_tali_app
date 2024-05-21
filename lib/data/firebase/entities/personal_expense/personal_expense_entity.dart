import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalExpenseEntity{
  late String id;
  late String details;
  late String date;
  late int amount;

  PersonalExpenseEntity({
    required this.id,
    required this.details,
    required this.date,
    required this.amount
  });

  PersonalExpenseEntity.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id = snapshot.id;
    details = (snapshot.data() as dynamic)['details'];
    date = (snapshot.data() as dynamic)['date'];
    amount = (snapshot.data() as dynamic)['amount'];
  }

  // factory PersonalExpenseEntity.fromJson(Map<String, dynamic> json ) => _$PersonalExpenseEntityFromJson(json);

  // factory PersonalExpenseEntity.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$PersonalExpenseEntityFromJson(json);
  // }

}


class PersonalExpenseEntities{
  String next;
  int entries;
  List<PersonalExpenseEntity> personalExpenseEntities;

  PersonalExpenseEntities({
    required this.next,
    required this.entries,
    required this.personalExpenseEntities
  });

  // factory PersonalExpenseEntities.fromJson(Map<String, dynamic> json ) => _$PersonalExpenseEntitiesFromJson(json);

  // factory PersonalExpenseEntities.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$PersonalExpenseEntitiesFromJson(json);
  // }

}

