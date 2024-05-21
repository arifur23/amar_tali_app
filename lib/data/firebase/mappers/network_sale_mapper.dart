import 'package:amar_tali_app/domain/exception/mapper_exception.dart';
import 'package:amar_tali_app/domain/models/sale_model/sale.dart';
import 'package:logger/logger.dart';

import '../entities/sale/sale_entity.dart';

class NetSaleMapper{
  final Logger log;

  NetSaleMapper({required this.log});

  Sale toSale(SaleEntity entity){
    try{
      return Sale(
          id: entity.id,
          details: entity.details,
          buyingPrice: entity.buyingPrice,
          date: entity.date,
          sellingPrice: entity.sellingPrice
      );
    }catch(e){
      throw MapperException<SaleEntity, Sale>(e.toString());
    }
  }

  List<Sale> toSales(List<SaleEntity> entities){
    try{
      final List<Sale> sales = [];
      for(final entity in entities){
        sales.add(toSale(entity));
      }
      return sales;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}