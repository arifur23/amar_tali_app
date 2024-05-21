import 'package:amar_tali_app/data/firebase/entities/buy/buy_entity.dart';
import 'package:amar_tali_app/domain/exception/mapper_exception.dart';
import 'package:amar_tali_app/domain/models/buy_model/buy.dart';
import 'package:logger/logger.dart';

class NetBuyMapper{
  final Logger log;

  NetBuyMapper({required this.log});

  Buy toBuy(BuyEntity entity){
    try{
      return Buy(
          id: entity.id,
          details: entity.details,
          amount: entity.amount,
          date: entity.date
      );
    }catch(e){
      throw MapperException<BuyEntity, Buy>(e.toString());
    }
  }

  List<Buy> toBuys(List<BuyEntity> entities){
    try{
      final List<Buy> buys = [];
      for(final entity in entities){
        buys.add(toBuy(entity));
      }
      return buys;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}