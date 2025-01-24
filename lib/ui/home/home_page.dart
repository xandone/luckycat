import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckycat/routes/page_path.dart';
import 'package:luckycat/ui/accouts/account_page.dart';
import 'package:luckycat/ui/accouts/controller/account_controller.dart';
import 'package:luckycat/ui/statistics/statistics_page.dart';

import '../../res/colors.dart';

/// @author: xiao
/// created on: 2025/1/17 10:01
/// description:

class HomePage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    RxInt _index = 0.obs;

    return Scaffold(
      backgroundColor: MyColors.appBgColor,
      body: Obx(() => Center(
            child: IndexedStack(
              index: _index.value,
              children: [AccountPage(), StatisticsPage()],
            ),
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: MyColors.textColor1,
            unselectedItemColor: MyColors.textColor2,
            currentIndex: _index.value,
            onTap: (index) => _index.value = index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: '账本'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), label: '统计')
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(PagePath.mAddAccountPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
