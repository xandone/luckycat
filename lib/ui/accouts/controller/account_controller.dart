import 'package:get/get.dart';
import 'package:luckycat/db/account_dao.dart';
import 'package:luckycat/ui/home/controller/home_controller.dart';

import '../../../utils/logger.dart';

/// @author: xiao
/// created on: 2025/1/22 14:54
/// description:

class AccountController extends GetxController {
  RxList<AccountDao> datas = RxList();
  HomeController homeController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void getAllNotes() {
    datas.clear();
    homeController.accountBox.getNotes().first.then((list) {
      Log.d('len=${list.length}');
      datas.addAll(list);
    });
  }
}
