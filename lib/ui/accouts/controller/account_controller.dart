import 'package:get/get.dart';
import 'package:luckycat/db/account_dao.dart';

import '../../../db/account_box.dart';
import '../../../db/objectbox.dart';
import '../../../objectbox.g.dart';
import '../../../utils/logger.dart';

/// @author: xiao
/// created on: 2025/1/22 14:54
/// description:

class AccountController extends GetxController {
  late AccountBox accountBox;

  RxList<AccountDao> datas = RxList();

  @override
  void onInit() {
    Log.d('onInit..3');
    initBox();
    super.onInit();
  }

  void initBox() async {
    accountBox = AccountBox();
    Box<AccountDao> box = await ObjectBox().createBox<AccountDao>();
    accountBox.initBox(box);
    getAllNotes();
  }

  void getAllNotes() {
    datas.clear();
    accountBox.getNotes().first.then((list) {
      Log.d('len=${list.length}');
      datas.addAll(list);
    });
  }
}
