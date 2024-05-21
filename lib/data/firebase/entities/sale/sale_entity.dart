import 'package:cloud_firestore/cloud_firestore.dart';

class SaleEntity{
  SaleEntity({
    required this.id,
    required this.details,
    required this.sellingPrice,
    required this.buyingPrice,
    required this.date,
  });

  late String id;
  late String details;
  late int sellingPrice;
  late int buyingPrice;
  late String date;

  SaleEntity.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id = snapshot.id;
    details =(snapshot.data() as dynamic)['details'];
    sellingPrice = (snapshot.data() as dynamic)['sellingPrice'];
    buyingPrice = (snapshot.data() as dynamic)['buyingPrice'];
    date = (snapshot.data() as dynamic)['date'];
  }

  // factory SellEntity.fromJson(Map<String, dynamic> json) => _$SellEntityFromJson(json);

  // factory SellEntity.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$SellEntityFromJson(json);
  // }

}

class SaleEntities{
  SaleEntities({
    required this.next,
    required this.entries,
    required this.saleEntities
  });

  String next;
  int entries;
  List<SaleEntity> saleEntities;

  // factory SellEntities.fromJson(Map<String, dynamic> json) => _$SellEntitiesFromJson(json);

  // factory SellEntities.fromJson(Map<String, dynamic> json) {
  //   json["date"] = ((json["date"] as Timestamp).toDate().toString());
  //   return _$SellEntitiesFromJson(json);
  // }

}
