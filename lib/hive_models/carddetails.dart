import 'package:hive/hive.dart';

part 'carddetails.g.dart';

@HiveType(typeId: 0)
class cardetails extends HiveObject {
  @HiveField(0)
  late String widget_name;

  @HiveField(1)
  late int count;

  @HiveField(2)
  late double timer;

  @HiveField(3)
  late List<String> dayTime;

  @HiveField(4)
  late List<String> date;
}
