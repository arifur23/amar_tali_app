import 'package:amar_tali_app/data/firebase/clients/base_client.dart';
import 'package:amar_tali_app/data/firebase/entities/main_cash/main_cash_entity.dart';

class MainCashClient{
  final BaseClient baseClient = BaseClient();

  Future<MainCashEntity> getMainCash() async{
    late MainCashEntity entity;
    try{
      await baseClient.firebaseFirestore.collection('mainCash').doc('XPlMdbJiE3hFWJh5KWSr').get().then((value) {
         entity = MainCashEntity.fromDocumentSnapShot(value);
      });
    }catch(e){
      print(e.toString());
    }

    return entity;
  }

  Future<void> updateMainCash(MainCashEntity mainCashEntity)async {

    try{
      var entity = await getMainCash();
      await baseClient.firebaseFirestore.collection('mainCash').doc('XPlMdbJiE3hFWJh5KWSr').update({
        'date': mainCashEntity.date,
        'amount' : (mainCashEntity.amount + entity.amount)
      });
    }catch(e){
      print(e.toString());
    }
  }
}