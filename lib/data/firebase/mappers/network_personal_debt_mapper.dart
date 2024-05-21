import 'package:amar_tali_app/data/firebase/entities/personal_debt/personal_debt_entity.dart';
import 'package:amar_tali_app/domain/exception/mapper_exception.dart';
import 'package:amar_tali_app/domain/models/personal_debt_model/personal_debt.dart';
import 'package:logger/logger.dart';

class NetPersonalDebtMapper {
  final Logger log;

  NetPersonalDebtMapper(this.log);

  PersonalDebt toPersonalDebt(PersonalDebtEntity entity){
   try{
     return PersonalDebt(
         id: entity.id,
         details: entity.details,
         amount: entity.amount,
         whom: entity.whom,
         isGet: entity.isGet,
         date: entity.date
     );
   }catch(e){
     throw MapperException<PersonalDebtEntity, PersonalDebt>(e.toString());
   }
  }

  List<PersonalDebt> toPersonalDebts(List<PersonalDebtEntity> entities){
    try{
      final List<PersonalDebt> personalDebts = [];
      for(final personalDebt in entities){
        personalDebts.add(toPersonalDebt(personalDebt));
      }
      return personalDebts;
    }catch(e){
      throw MapperException<PersonalDebtEntity, PersonalDebt>(e.toString());
    }
  }

}