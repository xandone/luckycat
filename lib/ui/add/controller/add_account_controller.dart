import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:luckycat/db/account_dao.dart';

import '../../../models/accout_model.dart';
import '../../../models/utils/convert_utils.dart';
import '../../../utils/date_format_utils.dart';
import '../../accouts/controller/account_controller.dart';

/// @author: xiao
/// created on: 2025/1/23 11:10
/// description:

class AddAccountController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  RxDouble inputMoney = 0.0.obs;
  AccountController accountController = Get.find();

  void commit() {
    AccoutModel model = AccoutModel(
        accountId: 1,
        date: MyDateUtil.getNowDateStr(),
        price: editingController.text,
        dealType: 0,
        modifyDate: null,
        remark: null,
        platformType: 0,
        platformName: '京东');

    AccountDao dao = ConvertUtils.getDaoByAccountMoedel(bean: model);
    accountController.accountBox.addNote(dao);
    accountController.datas.insert(0, dao);

    Get.back();
  }
}
