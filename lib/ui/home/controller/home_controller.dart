import 'package:get/get.dart';

import '../../../db/account_box.dart';
import '../../../db/account_dao.dart';
import '../../../db/objectbox.dart';
import '../../../objectbox.g.dart';
import '../../../utils/logger.dart';

/// @author: xiao
/// created on: 2025/1/23 14:56
/// description:

class HomeController extends GetxController {
  late AccountBox accountBox;

  @override
  void onInit() {
    Log.d('nini..');
    initBox();
    super.onInit();
  }

  void initBox() async {
    accountBox = AccountBox();
    Box<AccountDao> box = await ObjectBox().createBox<AccountDao>();
    accountBox.initBox(box);
  }

}
