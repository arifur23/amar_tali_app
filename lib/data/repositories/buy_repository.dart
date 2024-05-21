import 'package:amar_tali_app/data/firebase/clients/buy_client.dart';
import 'package:amar_tali_app/data/firebase/entities/buy/buy_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_buy_mapper.dart';
import 'package:amar_tali_app/domain/models/buy_model/buy.dart';

class BuyRepository{
  final BuyClient buyClient;
  final NetBuyMapper netBuyMapper;

  BuyRepository({required this.buyClient, required this.netBuyMapper});

  Future<Buy> getABuy(String id) async {
    final entity = await buyClient.getABuyEntity(id);
    final buy = netBuyMapper.toBuy(entity);

    return buy;
  }

  Future<List<Buy>> getAllBuy() async{
    final entities = await buyClient.getAllBuyEntities();
    final buys = netBuyMapper.toBuys(entities);
    return buys;
  }
}