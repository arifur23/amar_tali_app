import 'package:amar_tali_app/data/firebase/entities/business_debt/business_debt_entity.dart';
import 'package:amar_tali_app/data/firebase/entities/personal_debt/personal_debt_entity.dart';
import 'package:amar_tali_app/domain/exception/mapper_exception.dart';
import 'package:amar_tali_app/domain/models/business_debt_model/business_debt.dart';
import 'package:amar_tali_app/domain/models/personal_debt_model/personal_debt.dart';
import 'package:logger/logger.dart';

class NetBusinessDebtMapper {
  final Logger log;

  NetBusinessDebtMapper({required this.log});

  BusinessDebt toBusinessDebt(BusinessDebtEntity entity){
    try{
      print('Calling from Mapper to method');
      return BusinessDebt(
          id: entity.id,
          details: entity.details,
          amount: entity.amount,
          whom: entity.whom,
          isGet: entity.isGet,
          date: entity.date
      );
    }catch(e){
      throw MapperException<BusinessDebtEntity, BusinessDebt>(e.toString());
    }
  }

  List<BusinessDebt> toBusinessDebts(List<BusinessDebtEntity> entities){
    final List<BusinessDebt> businessDebts = [];
    try{
      for(final businessDebt in entities){
        businessDebts.add(toBusinessDebt(businessDebt));
        print('Business Debt from Net Mapper ${businessDebt.amount}');
      }
    }catch(e){
      throw MapperException<PersonalDebtEntity, PersonalDebt>(e.toString());
    }
    return businessDebts;
  }

}