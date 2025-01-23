import 'package:luckycat/db/account_dao.dart';

import '../accout_model.dart';

class ConvertUtils {
  static AccountDao getDaoByAccountMoedel({required AccoutModel bean}) {
    return AccountDao(
        accountId: bean.accountId,
        date: bean.date,
        price: bean.price,
        dealType: bean.dealType,
        modifyDate: bean.modifyDate,
        remark: bean.remark,
        platformType: bean.platformType,
        platformName: bean.platformName);
  }
}
