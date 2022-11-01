import 'package:hive/hive.dart';
import 'package:flutter_auth/hive_models/carddetails.dart';

class Boxes {
  static Box<cardetails> getCardetails() => Hive.box<cardetails>('carddetails');
}
