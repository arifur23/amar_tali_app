import 'package:amar_tali_app/data/firebase/clients/business_debt_client.dart';
import 'package:amar_tali_app/data/firebase/entities/business_debt/business_debt_entity.dart';
import 'package:amar_tali_app/data/firebase/mappers/network_business_debt_mapper.dart';
import 'package:amar_tali_app/domain/models/business_debt_model/business_debt.dart';

class BusinessDebtRepository{
  final BusinessDebtClient businessDebtClient;
  final NetBusinessDebtMapper netBusinessDebtMapper;

  BusinessDebtRepository({required this.businessDebtClient, required this.netBusinessDebtMapper});

  Future<List<BusinessDebt>> getAllBusinessDebt()async {

    print('Calling from  Repository');

    final entities = await businessDebtClient.getAllBusinessDebt();


    final businessDebts = netBusinessDebtMapper.toBusinessDebts(entities);
    print('Calling from Repository');
    return businessDebts;
  }

  Future<BusinessDebt> getABusinessDebt(String id)async {
    final entity = await businessDebtClient.getABusinessDebt(id);

    final businessDebt =  netBusinessDebtMapper.toBusinessDebt(entity);

    return businessDebt;
  }

  Future<void> addBusinessDebt(int amount, String details, String person, bool isGet, String date) async{
    BusinessDebtEntity businessDebtEntity = BusinessDebtEntity(
        id: '',
        details: details,
        date: date,
        amount: amount,
        isGet: isGet,
        whom: person
    );
    await businessDebtClient.addABusinessDebt(businessDebtEntity);
  }


}