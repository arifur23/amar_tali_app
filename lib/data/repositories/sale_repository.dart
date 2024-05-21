import 'package:amar_tali_app/data/firebase/clients/sale_client.dart';
import 'package:amar_tali_app/data/firebase/entities/sale/sale_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_sale_mapper.dart';
import 'package:amar_tali_app/domain/models/sale_model/sale.dart';

class SaleRepository {
  final SaleClient saleClient;
  final NetSaleMapper netSellMapper;

  SaleRepository({required this.saleClient, required this.netSellMapper});

  Future<Sale> getASale(String id) async{
    final entity = await saleClient.getASaleEntity(id);
    final sale = netSellMapper.toSale(entity);
    return sale;
  }

  Future<List<Sale>> getAllSales()async {
    final entities = await saleClient.getAllSaleEntities();
    final sales = netSellMapper.toSales(entities);

    return sales;
  }

  Future<void> addASale(int sellingPrice, int buyingPrice, String details, String date) async{
    SaleEntity saleEntity =SaleEntity(id: 'id', details: details, sellingPrice: sellingPrice, buyingPrice: buyingPrice, date: date);

    await saleClient.addASaleEntity(saleEntity);
  }
}