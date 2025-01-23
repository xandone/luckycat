// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/styles.dart';

class BottomBtnWidget extends StatelessWidget {
  String label;
  VoidCallback? onTap;

  BottomBtnWidget(this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      decoration: const BoxDecoration(color: MyColors.white),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return MyColors.disadbleBtnColor;
                }
                return MyColors.btnColor;
              }),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ))),
          child: Container(
            alignment: Alignment.center,
            height: 44,
            child: Text(
              label,
              style: MyStyles.btn_text_style,
            ),
          )),
    );
  }
}
