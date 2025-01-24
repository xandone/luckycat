import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:luckycat/db/account_dao.dart';

import '../../../config/constants.dart';
import '../../../models/accout_model.dart';
import '../../../models/utils/convert_utils.dart';
import '../../../utils/date_format_utils.dart';
import '../../../utils/logger.dart';
import '../../accouts/controller/account_controller.dart';

/// @author: xiao
/// created on: 2025/1/23 11:10
/// description:

class AddAccountController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  AccountController accountController = Get.find();

  RxInt dealType = 0.obs;
  RxInt platformType = 0.obs;

  commit() {
    double price = double.tryParse(editingController.text) ?? 0;
    if (dealType.value == 0) {
      price = -price;
    }
    Log.d('price=$price');
    AccoutModel model = AccoutModel(
        accountId: 1,
        date: MyDateUtil.getNowDateStr(),
        price: price,
        dealType: dealType.value,
        modifyDate: null,
        remark: null,
        platformType: platformType.value,
        platformName: Constants.platformNameList[platformType.value]);

    AccountDao dao = ConvertUtils.getDaoByAccountMoedel(bean: model);
    accountController.accountBox.addNote(dao);
    accountController.datas.insert(0, dao);

    Get.back();
  }
}
