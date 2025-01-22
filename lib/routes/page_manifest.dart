import 'package:get/get.dart';
import 'package:luckycat/routes/page_path.dart';
import 'package:luckycat/ui/accouts/account_page.dart';

import '../ui/accouts/controller/account_controller.dart';
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
      bindings: [],
    ),
    GetPage(
      name: PagePath.mHomeAccouts,
      page: () {
        return AccountPage();
      },
      bindings: [BindingsBuilder.put(() => AccountController())],
    ),
  ];
}
