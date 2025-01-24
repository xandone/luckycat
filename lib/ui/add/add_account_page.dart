import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../config/constants.dart';
import '../../res/colors.dart';
import '../../res/gaps.dart';
import '../../utils/assets_utils.dart';
import '../../utils/utils.dart';
import '../../widget/bottom_btn_widget.dart';
import 'controller/add_account_controller.dart';

/// @author: xiao
/// created on: 2025/1/23 9:29
/// description:

class AddAccountPage extends GetView<AddAccountController> {
  RxBool enableClick = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新增交易'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGaps10,
              Obx(() => Row(
                    children: [
                      _dealTypeWidget(0, '支出'),
                      _dealTypeWidget(1, '收入'),
                    ],
                  )),
              Gaps.vGaps10,
              Obx(() => Row(
                    children: [
                      _platformWidget(0, Constants.platformNameList[0]),
                      _platformWidget(1, Constants.platformNameList[1]),
                      _platformWidget(2, Constants.platformNameList[2]),
                    ],
                  )),
              Gaps.vGaps10,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  onChanged: (value) {
                    controller.editingController.text = value;
                    enableClick.value =
                        controller.editingController.text.isNotEmpty;
                  },
                  maxLength: 12,
                  controller: controller.editingController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: Utils.getInputFormatters(
                      const TextInputType.numberWithOptions(decimal: true)),
                  style:
                      const TextStyle(fontSize: 16, color: MyColors.textColor1),
                  decoration: InputDecoration(
                    hintText: '请输入..',
                    labelText: '金额',
                    counterText: '',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: MyColors.divideLineColor,
                      width: 1,
                    )),
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    // isDense: true,
                    hintStyle: const TextStyle(
                        color: MyColors.hintColor, fontSize: 16),
                    labelStyle: TextStyle(
                        color: controller.dealType.value == 0
                            ? MyColors.textColor1
                            : MyColors.incomeColor,
                        fontSize: 16),
                  ),
                ),
              ),
              Gaps.vGaps10,
              Obx(() => BottomBtnWidget(
                  '确定', enableClick.value ? controller.commit : null))
            ],
          ),
        ),
      ),
    );
  }

  _platformWidget(var rValue, var title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
            value: rValue,
            groupValue: controller.platformType.value,
            onChanged: (v) {
              controller.platformType.value = v;
            }),
        AssetsUtils.getPlatformSvg(rValue, size: 16),
        Text(
          title,
          style: const TextStyle(color: MyColors.textColor1, fontSize: 14),
        ),
      ],
    );
  }

  _dealTypeWidget(var rValue, var title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
            value: rValue,
            groupValue: controller.dealType.value,
            onChanged: (v) {
              controller.dealType.value = v;
            }),
        Text(
          title,
          style: const TextStyle(color: MyColors.textColor1, fontSize: 14),
        ),
      ],
    );
  }
}
