// ignore_for_file: unused_import, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unused_local_variable, unused_field, empty_statements, prefer_final_fields, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/Authfield.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/seller_login.dart';
import 'package:roadman_vegi/Screen/first_screen.dart';
import 'package:roadman_vegi/Screen/seller_verification.dart';
import 'package:roadman_vegi/Screen/SplashScreen.dart';
import 'package:roadman_vegi/Screen/StoreDetailsScreen.dart';

class SellerSignUpScreen extends StatefulWidget {
  const SellerSignUpScreen({Key key}) : super(key: key);

  @override
  State<SellerSignUpScreen> createState() => _SellerSignUpScreenState();
}

class _SellerSignUpScreenState extends State<SellerSignUpScreen> {
  final String textNumber = "+92";

  final TextController textController = Get.put(TextController());
  final Authfield authfield = Get.put(Authfield());
  final sellerformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SafeArea(
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
                  SizedBox(
                    height: 20,
                  ),
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
                    height: 20,
                  ),
                  Form(
                    key: sellerformkey,
                    child: Flexible(
                      flex: 5,
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
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Seller",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                controller: textController.phoneController,
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  counter: Offstage(),
                                  prefixText: textNumber,
                                  hintText: "Enter mobile number",
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
                                height: 25,
                              ),
                              TextFormField(
                                controller: textController.FirstName,
                                keyboardType: TextInputType.name,
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
                                height: 25,
                              ),
                              TextFormField(
                                controller: textController.LastName,
                                keyboardType: TextInputType.name,
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
                                height: 25,
                              ),
                              // TextFormField(
                              //   obscureText: true,
                              //   decoration: InputDecoration(
                              //     hintText: 'Password',
                              //     label: Text(
                              //       "Password",
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //     prefixIcon: Icon(
                              //       Icons.lock,
                              //     ),
                              //   ),
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 40,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 240,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (textController.phoneController.text ==
                                                "" ||
                                            textController.FirstName.text ==
                                                "" ||
                                            textController.LastName.text ==
                                                "") {
                                          Get.snackbar(
                                            "Alert",
                                            "Please Enter All Details",
                                            titleText: Text(
                                              "Alert",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            messageText: Text(
                                              "Please Enter All Details",
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
                                        } else {
                                          Get.to(OTPScreen(
                                            mobile: textController
                                                .phoneController.text,
                                            countrycode: textNumber,
                                          ));
                                        }
                                        // Get.to(OTPScreen(
                                        //   mobile: ,
                                        // ));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  // ignore: deprecated_member_use
                                ],
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
      ),
    );
  }
}
