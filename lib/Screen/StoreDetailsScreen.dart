// ignore_for_file: unused_import, file_names, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, avoid_unnecessary_containers, unnecessary_string_interpolations, curly_braces_in_flow_control_structures, prefer_void_to_null, annotate_overrides, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:roadman_vegi/Controller/Adddatetime.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:roadman_vegi/Screen/CongrationsScreen.dart';
import 'package:roadman_vegi/Screen/seller_login.dart';
import 'package:roadman_vegi/Screen/seller_verification.dart';
import 'package:roadman_vegi/constantType_datetime.dart';
import 'package:color/color.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({Key key, this.code}) : super(key: key);

  final String code;

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  final SellerController sellerController = Get.put(SellerController());
  final SellerAuthController sellerAuthController =
      Get.put(SellerAuthController());
  // late String _setTime, _setDate;

  // late String _hour, _minute, _time;

  // late String dateTime;

  // DateTime selectedDate = DateTime.now();

  // TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  // TextEditingController _dateController = TextEditingController();

  //static const colors = constChangecolor();
  void initState() {
    sellerAuthController.getCurrentLocation().then((value) =>
        sellerController.storeAddress = TextEditingController(
            text:
                "${sellerController.placeName}+    ${sellerController.shopAddress}"));
    sellerController.phoneController = TextEditingController(text: widget.code);
    sellerController.openTimeController1.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    sellerController.closeTimeController2.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  RxList<String> _status = ["Yes", "No"].obs;
  RxList<String> _status2 = ["Specific timing"].obs;
  String _singleValue = "Text alignment right";
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TimePick data = TimePick();
    Changecolor changecolor = Changecolor();

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.1,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 1.2,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    changecolor.primary_color,
                    changecolor.primary_dark,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        'assets/splashlogo.png',
                        width: 110,
                        height: 110,
                        //color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _key,
                    child: Expanded(
                      //  flex: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: changecolor.primary_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 30,
                              // ),
                              TextFormField(
                                controller: sellerController.firstName,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (!GetUtils.isNum(value)) {
                                      return null;
                                    } else {
                                      return "Not valid firstrname";
                                    }
                                  } else {
                                    return "This field cont be empty";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "First Name",
                                  label: Text(
                                    "First Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: sellerController.lastName,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (!GetUtils.isNum(value)) {
                                      return null;
                                    } else {
                                      return "Not valid lastrname";
                                    }
                                  } else {
                                    return "This field cont be empty";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Last Name",
                                  label: Text(
                                    "Last Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: sellerController.phoneController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (GetUtils.isPhoneNumber(value)) {
                                    return null;
                                  } else {
                                    return "Not valid number";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Phone No",
                                  label: Text(
                                    "Phone No",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: sellerController.storeName,
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (!GetUtils.isNum(value)) {
                                      return null;
                                    } else {
                                      return "Not valid storername";
                                    }
                                  } else {
                                    return "This field cont be empty";
                                  }
                                },
                                keyboardType: TextInputType.name,
                                // obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Store Name",
                                  label: Text(
                                    "Store Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.select_all_outlined,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              TextFormField(
                                controller: sellerController.city,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (!GetUtils.isNum(value)) {
                                      return null;
                                    } else {
                                      return "Not valid city";
                                    }
                                  } else {
                                    return "This field cont be empty";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "City",
                                  label: Text(
                                    "City",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.location_city,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                maxLines: 2,
                                controller: sellerController.storeAddress,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "Set your Loctaion",
                                  label: Text(
                                    "Loctaion",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.location_history,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        'Do you have a physical store?',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Obx(
                                        () => RadioGroup<String>.builder(
                                          direction: Axis.horizontal,
                                          groupValue: sellerController
                                              .physicalStoreGroupValue.value,
                                          horizontalAlignment:
                                              MainAxisAlignment.spaceAround,
                                          onChanged: (value) {
                                            sellerController
                                                .physicalStoreGroupValue
                                                .value = value;
                                            print(sellerController
                                                .physicalStoreGroupValue
                                                .value = value);
                                          },
                                          items: _status,
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          itemBuilder: (item) =>
                                              RadioButtonBuilder(
                                            item,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(() => sellerController
                                              .physicalStoreGroupValue.value ==
                                          "No"
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    height: 50,
                                                    width: 150,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                            side: BorderSide(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        sellerController
                                                            .saveSeller();
                                                      },
                                                      child: Text(
                                                        'Continue',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container()),
                                  Obx(() => sellerController
                                              .physicalStoreGroupValue.value ==
                                          "Yes"
                                      ? Column(
                                          children: [
                                            Text(
                                              'Physical store address',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Obx(
                                                    () => RadioGroup<
                                                        String>.builder(
                                                      direction:
                                                          Axis.horizontal,
                                                      groupValue:
                                                          sellerController
                                                              .timingGroupValue
                                                              .value,
                                                      horizontalAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      onChanged: (value) =>
                                                          sellerController
                                                              .timingGroupValue
                                                              .value = value,
                                                      items: _status2,
                                                      textStyle: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                      itemBuilder: (item) =>
                                                          RadioButtonBuilder(
                                                        item,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() => sellerController
                                              .timingGroupValue.value ==
                                          "Specific timing"
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Obx(
                                                  () => Container(
                                                    height: 50,
                                                    width: 100,
                                                    // ignore: deprecated_member_use
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            side: BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        StoreTiming
                                                            .openingtime.value,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        data.selectTime(
                                                            context,
                                                            sellerController
                                                                .openTimeController1,
                                                            1);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "-",
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Obx(
                                                  () => Container(
                                                    height: 50,
                                                    width: 100,
                                                    // ignore: deprecated_member_use
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            side: BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        StoreTiming
                                                            .closingtime.value,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        data.selectTime(
                                                            context,
                                                            sellerController
                                                                .closeTimeController2,
                                                            2);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 150,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      side: BorderSide(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  if (_key.currentState
                                                      .validate()) {
                                                    sellerController
                                                        .saveSeller();
                                                  } else {}
                                                },
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container())
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(Login());
                                  },
                                  child: Text(
                                    "Back to login",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DateFormat {
  static yMd() {}
}
