import 'package:hive/hive.dart';

import 'package:hive/hive.dart';

part 'theker.g.dart';

@HiveType(typeId: 0)
class Theker {
  @HiveField(0)
  String theker_text;
  @HiveField(1)
  int theker_number;
  @HiveField(2)
  String theker_reward;
  @HiveField(3)
  String theker_guide;
  @HiveField(4)
  String theker_header;
  Theker({
    required this.theker_text,
    required this.theker_number,
    required this.theker_reward,
    required this.theker_guide,
    required this.theker_header,
  });
}
