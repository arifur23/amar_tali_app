import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessDebtEntity{
    late String id;
    late String details;
    late int amount;
    late String date;
    late bool isGet;
    late String whom;

    BusinessDebtEntity({required this.id, required this.details, required this.amount, required this.date, required this.isGet, required this.whom});

    BusinessDebtEntity.fromDocumentSnapShot(DocumentSnapshot snapshot) {

      id = snapshot.id;
      details = (snapshot.data() as dynamic)['details'];
      amount = (snapshot.data() as dynamic)['amount'];
      whom = (snapshot.data() as dynamic)['whom'];
      isGet = (snapshot.data() as dynamic)['isGet'];
      date = (snapshot.data() as dynamic)['date'];

}

// part 'business_debt_entity.freezed.dart';
//
// @freezed
// class BusinessDebtEntity with _$BusinessDebtEntity {
//
//   // String id;
//   // String details;
//   // int amount;
//   // String date;
//   // bool isGet;
//   // String whom;
//   const BusinessDebtEntity._();
//
//   const factory BusinessDebtEntity({
//     required String id,
//     required String details,
//     required int amount,
//     required String whom,
//     required bool isGet,
//     required String date,
// }) = _BusinessDebtEntity;


  // factory BusinessDebtEntity.fromJson(Map<String, dynamic> json ) => _$BusinessDebtEntityFromJson(json);

  // factory BusinessDebtEntity.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$BusinessDebtEntityFromJson(json);
  // }
}

// @JsonSerializable()
// class BusinessDebtEntities{
//   String next;
//   int entries;
//   List<BusinessDebtEntity> businessDebtEntities;
//
//   BusinessDebtEntities({
//     required this.next,
//     required this.entries,
//     required this.businessDebtEntities
//   });
//
//   factory BusinessDebtEntities.fromJson(Map<String, dynamic> json ) => _$BusinessDebtEntitiesFromJson(json);
//
//   // // factory BusinessDebtEntities.fromJson(Map<String, dynamic> json) {
//   // //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
//   // //   return _$BusinessDebtEntitiesFromJson(json);
//   // // }
//
// }