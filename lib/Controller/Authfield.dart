// ignore_for_file: unused_import, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import "package:get/get.dart";

class Authfield extends GetxController {
  final RxString password = 'Password'.obs;
  final RxString number = 'Enter your number'.obs;
  final RxString first_name = 'First Name'.obs;
  final RxString last_name = 'Last Name'.obs;
  final RxString select_type = 'Select Type'.obs;
  final RxString store_address = 'Store Address'.obs;
  final RxString city = 'City'.obs;
}
