import 'package:get/get.dart';
import 'package:luckycat/routes/page_path.dart';
import 'package:luckycat/ui/accouts/account_page.dart';
import 'package:luckycat/ui/add/add_account_page.dart';

import '../ui/accouts/controller/account_controller.dart';
import '../ui/add/controller/add_account_controller.dart';
import '../ui/home/controller/home_controller.dart';
import '../ui/home/home_page.dart';

/// @author: xandone
/// created on: 2025/1/17 11:14
/// description:

class PageManifest {
  PageManifest._();

  static final routes = [
    GetPage(
      name: PagePath.mHome,
      page: () {
        return HomePage();
      },
      bindings: [BindingsBuilder.put(() => HomeController())],
    ),
    GetPage(
      name: PagePath.mAddAccountPage,
      page: () {
        return AddAccountPage();
      },
      bindings: [BindingsBuilder.put(() => AddAccountController())],
    ),
  ];
}
