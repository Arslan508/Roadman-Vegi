// ignore_for_file: file_names, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, unrelated_type_equality_checks, unnecessary_null_comparison, unnecessary_import, unused_field, prefer_final_fields, unused_element, empty_statements, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/Authfield.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:roadman_vegi/Controller/buyer_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/BuyerSignUpScreen.dart';
import 'package:roadman_vegi/Screen/ForgetPassword.dart';
import 'package:roadman_vegi/Screen/first_screen.dart';
import 'package:roadman_vegi/Screen/seller_verification.dart';
import 'package:roadman_vegi/Screen/SellerSignUpScreen.dart';
import 'package:roadman_vegi/Screen/SplashScreen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:roadman_vegi/Screen/buyer_verification.dart';

class BuyerLogin extends StatefulWidget {
  const BuyerLogin({Key key}) : super(key: key);

  @override
  State<BuyerLogin> createState() => _BuyerLoginState();
}

class _BuyerLoginState extends State<BuyerLogin> {
  final BuyerController buyerController = Get.put(BuyerController());
  final Authfield _authfield = Get.put(Authfield());
  final _fromkey = GlobalKey<FormState>();
  final String textNumber = "+92";

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 50.0),
                  child: Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          "Buyer Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Form(
                  key: _fromkey,
                  child: Flexible(
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
                        padding: const EdgeInsets.all(34.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                'assets/splashlogo.png',
                                width: 120,
                                height: 120,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: buyerController.phoneController,
                              // controller: TextEditingController(
                              //   text: _authfield.number.value,
                              // ),
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixText: textNumber,
                                counter: Offstage(),
                                hintText: "Enter your number",
                                label: Text(
                                  "Enter your number",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.phone_android_outlined,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 240,
                                  // ignore: deprecated_member_use
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Buyer Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (buyerController
                                              .phoneController.text ==
                                          "")
                                        Get.snackbar(
                                          "Alert",
                                          "Please Enter Phone Number",
                                          titleText: Text(
                                            "Alert",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          messageText: Text(
                                            "Please Enter Phone Number",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ),
                                          backgroundColor:
                                              changecolor.primary_dark,
                                          borderRadius: 20,
                                          margin: EdgeInsets.all(10),
                                        );
                                      else {
                                        Get.to(BuyerVerificaion(
                                          mobile: buyerController
                                              .phoneController.text,
                                          countrycode: textNumber,
                                        ));
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                // ignore: deprecated_member_use
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
    );
  }
}
