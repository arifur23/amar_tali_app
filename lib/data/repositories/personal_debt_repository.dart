import 'package:amar_tali_app/data/firebase/clients/personal_debt_client.dart';
import 'package:amar_tali_app/data/firebase/entities/personal_debt/personal_debt_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_personal_debt_mapper.dart';
import 'package:amar_tali_app/domain/models/personal_debt_model/personal_debt.dart';

class PersonalDebtRepository{
  final PersonalDebtClient personalDebtClient;
  final NetPersonalDebtMapper netPersonalDebtMapper;

  PersonalDebtRepository({required this.personalDebtClient, required this.netPersonalDebtMapper});

  Future<PersonalDebt> getAPersonalDebt(String id) async{
    final entity = await personalDebtClient.getAPersonalDebt(id);
    final personalDebt = netPersonalDebtMapper.toPersonalDebt(entity);

    return personalDebt;
  }

  Future<List<PersonalDebt>> getAllPersonalDebt()async {
    final entities = await personalDebtClient.getAllPersonalDebt();
    final personalDebts = netPersonalDebtMapper.toPersonalDebts(entities);
    return personalDebts;
  }

  Future<void> addAPersonalDebt(int amount, String details, String person, bool isGet, String date) async{
    PersonalDebtEntity personalDebtEntity = PersonalDebtEntity(id: 'id', details: details, amount: amount, whom: person, isGet: isGet, date: date);

    await personalDebtClient.addAPersonalDebt(personalDebtEntity);
  }
}