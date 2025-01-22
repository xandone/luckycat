import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckycat/res/colors.dart';

/// @author: xiao
/// created on: 2025/1/22 14:43
/// description:
class StatisticsPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appBgColor,
      appBar: AppBar(
        title: Text('统计'),
      ),
    );
  }
}
