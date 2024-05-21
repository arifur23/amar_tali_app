import 'package:amar_tali_app/data/firebase/clients/base_client.dart';
import 'package:amar_tali_app/data/firebase/entities/business_expense/business_expense_entity.dart';

class BusinessExpenseClient{
  BaseClient client = BaseClient();

  Future<void> addABusinessExpense(BusinessExpenseEntity entity) async{
    await client.firebaseFirestore.collection('businessExpenses').add({
      'details' : entity.details,
      'date' : entity.date,
      'amount' : entity.amount,
    }).then((value) {
      print(entity.amount.toString());
      print(entity.date.toString());
      print(entity.details.toString());
    });
  }

  Future<BusinessExpenseEntity> getABusinessExpense(String id) async{
    var entity;
    try{
      client.firebaseFirestore.collection('businessExpenses').doc(id).get().then((value){
        entity = BusinessExpenseEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }
    return entity;
  }

  Future<List<BusinessExpenseEntity>> getAllBusinessExpenses() async {
    List<BusinessExpenseEntity> businessExpenses = [];
    try{
      await client.firebaseFirestore.collection('businessExpenses').get().then((value) {
        for(var snapshot in value.docs){
          var d = BusinessExpenseEntity.fromDocumentSnapShot(snapshot);
          businessExpenses.add(d);
        }
      });


    }catch(e){
      print(e.toString());
    }
    return businessExpenses;
  }

  Future<void> deleteABusinessExpense(String id) async{
    try{
      await client.firebaseFirestore.collection('businessExpenses').doc(id).delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> updateABusinessExpense(String id) async{
    try{
      await client.firebaseFirestore.collection('businessExpenses').doc(id).update({

      });
    }catch(e){
      print(e.toString());
    }
  }
}