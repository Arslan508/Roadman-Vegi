// ignore_for_file: non_constant_identifier_names, unused_import, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreTiming extends GetxController {
  static var openingtime = 'Opening'.obs;
  static var closingtime = 'Closing'.obs;
  static Rx<TimeOfDay> selectedTime = TimeOfDay(hour: 00, minute: 00).obs;
}
