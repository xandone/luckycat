import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class AccoutModel {
  AccoutModel({
    required this.accountId,
    required this.date,
    required this.price,
    required this.dealType,
    required this.modifyDate,
    required this.remark,
    required this.platformType,
    required this.platformName,
  });

  factory AccoutModel.fromJson(Map<String, dynamic> json) => AccoutModel(
        accountId: asT<int>(json['accountId'])!,
        date: asT<String>(json['date'])!,
        price: asT<String>(json['price'])!,
        dealType: asT<int>(json['dealType'])!,
        modifyDate: asT<String>(json['modifyDate']),
        remark: asT<String>(json['remark']),
        platformType: asT<int>(json['platformType'])!,
        platformName: asT<String>(json['platformName'])!,
      );

  int accountId;
  String date;
  String price;

  //0支出，1赎回
  int dealType;
  String? modifyDate;
  String? remark;

  //0JD，2ZH
  int platformType;
  String platformName;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountId': accountId,
        'date': date,
        'price': price,
        'dealType': dealType,
        'modifyDate': modifyDate,
        'remark': remark,
        'platformType': platformType,
        'platformName': platformName,
      };
}
