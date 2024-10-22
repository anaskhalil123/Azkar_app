import 'package:hive/hive.dart';

part 'thekerheader.g.dart';

@HiveType(typeId: 1)
class ThekerHeader {
  @HiveField(0)
  String text;

  ThekerHeader({required this.text});
}
