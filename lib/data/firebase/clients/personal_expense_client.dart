import 'package:amar_tali_app/data/firebase/entities/personal_expense/personal_expense_entity.dart';

import 'base_client.dart';

class PersonalExpenseClient{
  BaseClient client = BaseClient();

  Future<void> addAPersonalExpense(PersonalExpenseEntity entity) async{
    await client.firebaseFirestore.collection('personalExpenses').add({
      'details' : entity.details,
      'date' : entity.date,
      'amount' : entity.amount,
    }).then((value) {
      print(entity.details);
      print(entity.date);
      print(entity.amount.toString());
    });
  }

  Future<PersonalExpenseEntity> getAPersonalExpense(String id) async{
    var entity;
    try{
      client.firebaseFirestore.collection('personalExpenses').doc(id).get().then((value){
        entity = PersonalExpenseEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }
    return entity;
  }

  Future<List<PersonalExpenseEntity>> getAllPersonalExpenses() async {
    List<PersonalExpenseEntity> personalExpenses = [];
    try{
      await client.firebaseFirestore.collection('personalExpenses').get().then((value) {
        for(var snapshot in value.docs){
          var d = PersonalExpenseEntity.fromDocumentSnapShot(snapshot);
          personalExpenses.add(d);
        }
      });
    }catch(e){
      print(e.toString());
    }
    return personalExpenses;
  }

  Future<void> deletePersonalExpense(String id) async{
    try{
      await client.firebaseFirestore.collection('personalExpenses').doc(id).delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateAPersonalExpense(String id) async{
    try{
      await client.firebaseFirestore.collection('personalExpenses').doc(id).update({

      });
    }catch(e){
      print(e.toString());
    }
  }
}