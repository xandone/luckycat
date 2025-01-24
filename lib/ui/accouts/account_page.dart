import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckycat/res/colors.dart';
import 'package:luckycat/ui/accouts/controller/account_controller.dart';

/// @author: xiao
/// created on: 2025/1/22 14:43
/// description:
class AccountPage extends StatelessWidget {
  AccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appBgColor,
      appBar: AppBar(
        title: Text('账本'),
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.datas.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.datas[index].price),
            );
          })),
    );
  }
}
