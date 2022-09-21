// ignore_for_file: prefer_const_constructors, unused_import, file_names, sized_box_for_whitespace, empty_statements, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_local_variable, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/Authfield.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Controller/buyer_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/AddProductScreenTwo.dart';
import 'package:roadman_vegi/Screen/seller_login.dart';
import 'package:roadman_vegi/Screen/first_screen.dart';
import 'package:roadman_vegi/Screen/seller_verification.dart';
import 'package:roadman_vegi/Screen/SplashScreen.dart';
import 'package:roadman_vegi/Screen/Seller_store_show.dart';

class BuyerSignUpScreen extends StatefulWidget {
  const BuyerSignUpScreen({Key key, this.code}) : super(key: key);
  final String code;
  @override
  State<BuyerSignUpScreen> createState() => _BuyerSignUpScreenState();
}

class _BuyerSignUpScreenState extends State<BuyerSignUpScreen> {
  final BuyerController buyerController = Get.put(BuyerController());
  final String textNumber = "+92";
  final BuyerAuthController buyerAuthController =
      Get.put(BuyerAuthController());

  //final _buyerkey = GlobalKey<FormState>();
  @override
  void initState() {
    buyerController.phoneController = TextEditingController(text: widget.code);
    buyerAuthController.getCurrentLocation().then((value) =>
        buyerController.buyerAddressController = TextEditingController(
            text:
                "${buyerController.placeName}+${buyerController.buyersAddress}"));
    setState(() {});
    print("place name: ${buyerController.placeName}");
    print(buyerController.buyersAddress);

    // buyerAuthController.getCurrentLocation().then((value) =>

    //     buyerController.buyerAddress = TextEditingController(
    //         text:
    //             "${buyerController.placeName} ${buyerController.buyersAddress}"));

    // TODO: implement initState
    super.initState();
  }

  final _key = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();
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
                    key: _key,
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
                              Text(
                                "Buyer",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: buyerController.phoneController,

                                // controller: TextEditingController(
                                //   text: _authfield.number.value),
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (GetUtils.isPhoneNumber(value)) {
                                    return null;
                                  } else {
                                    return "Not valid number";
                                  }
                                },
                                decoration: InputDecoration(
                                  counter: Offstage(),
                                  //prefixText: textNumber,
                                  hintText: 'Enter your number',
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
                              TextFormField(
                                controller: buyerController.firstName,
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
                                // obscureText: true,
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
                                height: 20,
                              ),
                              TextFormField(
                                controller: buyerController.lastName,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (!GetUtils.isNum(value)) {
                                      return null;
                                    } else {
                                      return "Not valid lastname";
                                    }
                                  } else {
                                    return "This field cont be empty";
                                  }
                                },
                                //obscureText: true,
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
                                height: 20,
                              ),
                              TextFormField(
                                maxLines: 2,
                                controller:
                                    buyerController.buyerAddressController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: Icon(CupertinoIcons.location)),
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
                                        if (_key.currentState.validate()) {
                                          buyerController.saveBuyer();
                                        } else {}
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
