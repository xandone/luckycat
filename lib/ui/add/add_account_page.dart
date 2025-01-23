import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:luckycat/utils/toast.dart';

import '../../res/colors.dart';
import '../../res/gaps.dart';
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
        title: Text('新增交易'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGaps10,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  onChanged: (value) {
                    controller.editingController.text = value;
                    controller.inputMoney.value = double.tryParse(value) ?? 0;
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
                  decoration: const InputDecoration(
                    hintText: '请输入..',
                    labelText: '金额',
                    counterText: '',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: MyColors.divideLineColor,
                      width: 1,
                    )),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    // isDense: true,
                    hintStyle:
                        TextStyle(color: MyColors.hintColor, fontSize: 16),
                    labelStyle:
                        TextStyle(color: MyColors.textColor1, fontSize: 16),
                  ),
                ),
              ),
              Gaps.vGaps10,
              Obx(() =>
                  BottomBtnWidget('确定', enableClick.value ? _commit : null))
            ],
          ),
        ),
      ),
    );
  }

  void _commit() {
    MyToast.showToast('提交');
  }
}
