import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luckycat/res/colors.dart';
import 'package:luckycat/ui/accouts/controller/account_controller.dart';
import 'package:luckycat/utils/assets_utils.dart';
import 'package:luckycat/utils/date_format_utils.dart';

import '../../utils/utils.dart';

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
              tileColor: MyColors.white,
              title: Text(controller.datas[index].dealType == 0 ? '支出' : '收入'),
              leading: AssetsUtils.getPlatformSvg(
                  controller.datas[index].platformType),
              subtitle: Text(
                MyDateUtil.formatDateStr(controller.datas[index].date),
                style: const TextStyle(color: MyColors.textColor2),
              ),
              trailing: Text(
                Utils.formatCurrencyPlusOrMinus(controller.datas[index].price),
                style: TextStyle(
                    fontSize: 14,
                    color: controller.datas[index].dealType == 0
                        ? MyColors.textColor1
                        : MyColors.incomeColor),
              ),
            );
          })),
    );
  }
}
