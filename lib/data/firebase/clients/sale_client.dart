import 'package:amar_tali_app/data/firebase/entities/sale/sale_entity.dart';
import 'base_client.dart';

class SaleClient{
  BaseClient client = BaseClient();

  Future<void> addASaleEntity(SaleEntity entity) async{
    await client.firebaseFirestore.collection('sells').add({
      'details' : entity.details,
      'date' : entity.date,
      'sellingPrice' : entity.sellingPrice,
      'buyingPrice' : entity.buyingPrice,
    }).then((value) {
      print(entity.date);
      print(entity.details);
      print(entity.sellingPrice.toString());
      print(entity.buyingPrice.toString());
    });
  }

  Future<SaleEntity> getASaleEntity(String id) async{
    var entity;
    try{
      client.firebaseFirestore.collection('sells').doc(id).get().then((value){
        entity = SaleEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }
    return entity;
  }

  Future<List<SaleEntity>> getAllSaleEntities() async {
    List<SaleEntity> sellEntities = [];
    try{
      await client.firebaseFirestore.collection('sells').get().then((value) {
        for(var snapshot in value.docs){
          var d = SaleEntity.fromDocumentSnapShot(snapshot);
          sellEntities.add(d);
        }
      });
    }catch(e){
      print(e.toString());
    }
    return sellEntities;
  }

  Future<void> deleteASaleEntity(String id) async{
    try{
      await client.firebaseFirestore.collection('sells').doc(id).delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateASaleEntity(String id) async{
    try{
      await client.firebaseFirestore.collection('sells').doc(id).update({

      });
    }catch(e){
      print(e.toString());
    }
  }
}