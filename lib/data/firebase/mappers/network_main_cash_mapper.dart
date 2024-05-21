import 'package:amar_tali_app/data/firebase/entities/main_cash/main_cash_entity.dart';
import 'package:amar_tali_app/domain/exception/mapper_exception.dart';
import 'package:amar_tali_app/domain/models/cash_model/main_cash.dart';
import 'package:logger/logger.dart';

class NetworkMainCashMapper{
  final Logger log;

  NetworkMainCashMapper({required this.log});

  MainCash toMainCashEntity(MainCashEntity mainCashEntity) {
    try{
      return MainCash(id: mainCashEntity.id, amount: mainCashEntity.amount, date: mainCashEntity.date);
    }catch(e){
      throw MapperException<MainCashEntity, MainCash>(e.toString());
    }
  }


}