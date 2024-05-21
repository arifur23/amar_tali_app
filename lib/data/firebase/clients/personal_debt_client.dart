import 'package:amar_tali_app/data/firebase/clients/base_client.dart';

import '../entities/personal_debt/personal_debt_entity.dart';

class PersonalDebtClient{
  BaseClient client = BaseClient();

  Future<void> addAPersonalDebt(PersonalDebtEntity entity) async{
    await client.firebaseFirestore.collection('personalDebts').add({
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

  Future<PersonalDebtEntity> getAPersonalDebt(String id) async{
    var entity;
    try{
      client.firebaseFirestore.collection('personalDebts').doc(id).get().then((value){
        entity = PersonalDebtEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }
    return entity;
  }

  Future<List<PersonalDebtEntity>> getAllPersonalDebt() async {
    List<PersonalDebtEntity> personalDebt = [];
    try{
      await client.firebaseFirestore.collection('personalDebts').get().then((value) {
        print(value.toString()+ "fghjk");
        for(var snapshot in value.docs){
          var d = PersonalDebtEntity.fromDocumentSnapShot(snapshot);
          personalDebt.add(d);
        }
      });
    }catch(e){
      // print(e.toString());
    }
    return personalDebt;
  }

  Future<void> deletePersonalDebt(String id) async{
    try{
      await client.firebaseFirestore.collection('personalDebts').doc(id).delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateAPersonalDebt(String id) async{
    try{
      await client.firebaseFirestore.collection('personalDebts').doc(id).update({

      });
    }catch(e){
      print(e.toString());
    }
  }
}