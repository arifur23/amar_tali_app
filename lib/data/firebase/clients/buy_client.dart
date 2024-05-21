import 'package:amar_tali_app/data/firebase/entities/buy/buy_entity.dart';

import 'base_client.dart';

class BuyClient{
  BaseClient client = BaseClient();

  Future<void> addABuyEntity(BuyEntity entity) async{
    await client.firebaseFirestore.collection('buys').add({
      'details' : entity.details,
      'date' : entity.date,
      'amount' : entity.amount,
    }).then((value) {

    });
  }

  Future<BuyEntity> getABuyEntity(String id) async{
    var entity;
    try{
      client.firebaseFirestore.collection('buys').doc(id).get().then((value){
        entity = BuyEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }
    return entity;
  }

  Future<List<BuyEntity>> getAllBuyEntities() async {
    List<BuyEntity> buyEntities = [];
    try{
      await client.firebaseFirestore.collection('buys').get().then((value) {
        for(var snapshot in value.docs){
          var d = BuyEntity.fromDocumentSnapShot(snapshot);
          buyEntities.add(d);
        }
      });
    }catch(e){
      print(e.toString());
    }
    return buyEntities;
  }

  Future<void> deleteABuyEntity(String id) async{
    try{
      await client.firebaseFirestore.collection('buys').doc(id).delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateABuyEntity(BuyEntity buyEntity) async{
    try{
      await client.firebaseFirestore.collection('buys').doc(buyEntity.id).update({

      });
    }catch(e){
      print(e.toString());
    }
  }
}