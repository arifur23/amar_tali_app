import 'package:amar_tali_app/data/firebase/clients/main_cash_client.dart';
import 'package:amar_tali_app/data/firebase/entities/main_cash/main_cash_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_main_cash_mapper.dart';
import 'package:amar_tali_app/domain/models/cash_model/main_cash.dart';

class MainCashRepository{
  final MainCashClient mainCashClient;
  final NetworkMainCashMapper networkMainCashMapper;
MainCashRepository({required this.networkMainCashMapper, required this.mainCashClient});

  Future<MainCash> getMainCash()async{
   var entity = await mainCashClient.getMainCash();
   return networkMainCashMapper.toMainCashEntity(entity);
  }

  Future<void> updateMainCash(int amount, String date)async{
    await mainCashClient.updateMainCash(MainCashEntity(id: 'id', amount: amount, date: date));
  }

}