import 'package:amar_tali_app/data/firebase/clients/base_client.dart';
import 'package:amar_tali_app/data/firebase/entities/business_debt/business_debt_entity.dart';

class BusinessDebtClient{
  BaseClient client = BaseClient();

  Future<void> addABusinessDebt(BusinessDebtEntity entity) async{

    await client.firebaseFirestore.collection('businessDebts').add({
      'details' : entity.details,
      'date' : entity.date,
      'amount' : entity.amount,
      'isGet' : entity.isGet,
      'whom' : entity.whom,
    }).then((value) {
      print(entity.amount.toString());
      print(entity.date.toString());
      print(entity.details.toString());
      print(entity.isGet.toString());
      print(entity.whom.toString());
    });
  }

  Future<BusinessDebtEntity> getABusinessDebt(String id) async{

    var entity;

    try{
      client.firebaseFirestore.collection('businessDebts').doc(id).get().then((value){
        entity = BusinessDebtEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }
    return entity;
  }

  Future<List<BusinessDebtEntity>> getAllBusinessDebt() async {
    List<BusinessDebtEntity> businessDebt = [];
    try{
      await client.firebaseFirestore.collection('businessDebts').get().then((value) {
        for(var snapshot in value.docs){
          print('Calling from  Client');
          var d = BusinessDebtEntity.fromDocumentSnapShot(snapshot);
          businessDebt.add(d);
          print('Calling from Client');
        }
      });
    }catch(e){
      print(e.toString());
    }
    return businessDebt;
  }

  Future<void> deleteABusinessDebt(String id) async{
    try{
      await client.firebaseFirestore.collection('businessDebts').doc(id).delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateABusinessDebt(String id) async{
    try{
      await client.firebaseFirestore.collection('businessDebts').doc(id).update({

      });
    }catch(e){
      print(e.toString());
    }
  }

}