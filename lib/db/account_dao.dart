import 'package:objectbox/objectbox.dart';

@Entity()
class AccountDao {
  @Id()
  int id;

  AccountDao({
    this.id = 0,
    required this.accountId,
    required this.date,
    required this.price,
    required this.dealType,
    required this.modifyDate,
    required this.remark,
    required this.platformType,
    required this.platformName,
  });

  int accountId;
  String date;
  double price;

  //0支出，1收入
  int dealType;
  String? modifyDate;
  String? remark;

  //0JD，2ZH
  int platformType;
  String platformName;
}
