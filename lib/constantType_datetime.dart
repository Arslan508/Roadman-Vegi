// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, file_names, prefer_void_to_null, empty_statements

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:roadman_vegi/Controller/Adddatetime.dart';

class TimePick {
  Future<Null> selectTime(BuildContext context, controllerr, time) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: StoreTiming.selectedTime.value,
    );
    if (picked != null) {
      StoreTiming.selectedTime.value = picked;
      controllerr.text = formatDate(
          DateTime(2019, 08, 1, StoreTiming.selectedTime.value.hour,
              StoreTiming.selectedTime.value.minute),
          [hh, ':', nn, " ", am]).toString();

      if (time == 1) {
        StoreTiming.openingtime.value = controllerr.text;
      } else if (time == 2) {
        StoreTiming.closingtime.value = controllerr.text;
      }
    }
    ;
  }
}
