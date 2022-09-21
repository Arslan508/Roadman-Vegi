// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController storeName = TextEditingController();
  TextEditingController storeAddress = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController physicalStore = TextEditingController();
  TextEditingController SpecificTiming = TextEditingController();
  TextEditingController AllDays = TextEditingController();
  // TextEditingController OpeningTiming = TextEditingController();
  // TextEditingController CloseTiming = TextEditingController();

  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();

  // RxBool ValidPhoneNumber = false.obs;
  RxBool isSeller = false.obs;
  RxBool showPassword = false.obs;
  RxBool forget_password = false.obs;
  //TextFormField Validate Controller
  String validateNumber(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number';
    } else {
      return validateNumber(value);
    }
  }

  String validateFirstName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter firstname';
    } else {
      return validateFirstName(value);
    }
  }

  String validateLastName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter lastname';
    } else {
      return validateLastName(value);
    }
  }

  String validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else {
      return validatePassword(value);
    }
  }
}
