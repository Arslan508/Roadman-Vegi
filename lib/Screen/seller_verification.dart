// ignore_for_file: unused_import, file_names, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_is_empty, must_be_immutable, unnecessary_null_comparison, avoid_print, unused_element, duplicate_ignore, duplicate_ignore, prefer_function_declarations_over_variables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roadman_vegi/Controller/TextFieldOTP.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:roadman_vegi/Screen/AddProductScreenTwo.dart';
import 'package:roadman_vegi/Screen/BuyerSignUpScreen.dart';
import 'package:roadman_vegi/Screen/CongrationsScreen.dart';
import 'package:roadman_vegi/Screen/seller_login.dart';
import 'package:roadman_vegi/Screen/SplashScreen.dart';
import 'package:roadman_vegi/Screen/StoreDetailsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

class OTPScreen extends StatefulWidget {
  String countrycode;
  String mobile;

  OTPScreen({Key key, this.countrycode, this.mobile}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextFieldOTP textFieldOTP = Get.put(TextFieldOTP());

  final TextController textController = Get.put(TextController());
  bool isLoading = false;
  static const double dist = 3.0;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  FocusNode controller1fn = FocusNode();
  FocusNode controller2fn = FocusNode();
  FocusNode controller3fn = FocusNode();
  FocusNode controller4fn = FocusNode();
  FocusNode controller5fn = FocusNode();
  FocusNode controller6fn = FocusNode();
  TextEditingController currController = TextEditingController();
  String _verificationId;
  bool autovalidate = false;
  final SellerAuthController sellerAuth = Get.put(SellerAuthController());
  @override
  void initState() {
    super.initState();
    currController = controller1;

    _verifyPhoneNumber();
  }

  verifyOtp(String otpText) async {
    _signInWithPhoneNumber(otpText);
  }

  void _signInWithPhoneNumber(String otp) async {
    _showProgressDialog(true);
    if (await checkInternet()) {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: otp,
        );
        final User user =
            (await sellerAuth.firebaseAuth.signInWithCredential(credential))
                .user;
        final User currentUser = sellerAuth.firebaseAuth.currentUser;
        assert(user.uid == currentUser.uid);
        print("verify id is ${currentUser.uid}");
        sellerAuth.isUserExists();

        _showProgressDialog(false);
        if (user != null) {
          print(user);
          //
          // authController.isUserExists();

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => BottomNavBar(
          //             user: user,
          //           )),
          // );
        } else {
          Get.snackbar(
            "Alert",
            "Sign in failed",
          );
        }
      } catch (e) {
        print(e);

        Get.snackbar("Alert", e.toString());
        _showProgressDialog(false);
      }
    } else {
      _showProgressDialog(false);
      Get.snackbar(
        "Alert",
        "No internet connection",
      );
    }
  }

  _showProgressDialog(bool isloadingstate) {
    if (mounted) {
      setState(() {
        isLoading = isloadingstate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Changecolor changecolor = Changecolor();
    List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            cursorColor: Colors.white,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            enabled: true,
            controller: controller1,
            autofocus: true,
            focusNode: controller1fn,
            onChanged: (ct) {
              if (ct.length > 0) {
                _fieldFocusChange(context, controller1fn, controller2fn);
              }
            },
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onChanged: (ct) {
              if (ct.length > 0) {
                _fieldFocusChange(context, controller2fn, controller3fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller2fn, controller1fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            controller: controller2,
            focusNode: controller2fn,
            enabled: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextField(
            onChanged: (ct) {
              if (ct.length > 0) {
                _fieldFocusChange(context, controller3fn, controller4fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller3fn, controller2fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller3,
            focusNode: controller3fn,
            textAlign: TextAlign.center,
            cursorColor: changecolor.primary_color,
            enabled: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextField(
            onChanged: (ct) {
              if (ct.length > 0) {
                _fieldFocusChange(context, controller4fn, controller5fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller4fn, controller3fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller4,
            focusNode: controller4fn,
            enabled: true,
            cursorColor: changecolor.primary_color,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextField(
            onChanged: (ct) {
              if (ct.length > 0) {
                _fieldFocusChange(context, controller5fn, controller6fn);
              } else if (ct.length == 0) {
                _fieldFocusChange(context, controller5fn, controller4fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller5,
            focusNode: controller5fn,
            textAlign: TextAlign.center,
            enabled: true,
            cursorColor: changecolor.primary_color,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: dist, left: dist),
        child: Container(
          alignment: Alignment.center,
          child: TextField(
            onChanged: (ct) {
              if (ct.length == 0) {
                _fieldFocusChange(context, controller6fn, controller5fn);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: controller6,
            focusNode: controller6fn,
            enabled: true,
            cursorColor: changecolor.primary_color,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ];
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
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    // color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/otpimage.png',
                    height: 190,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your code number",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(1.0),
                //   child: Container(
                //     height: 50,
                //     //width: 10,
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           width: 10,
                //         ),
                //         _textFieldOTP(first: true, last: false),
                //         SizedBox(
                //           width: 7,
                //         ),
                //         _textFieldOTP(first: true, last: false),
                //         SizedBox(
                //           width: 7,
                //         ),
                //         _textFieldOTP(first: true, last: false),
                //         SizedBox(
                //           width: 7,
                //         ),
                //         _textFieldOTP(first: true, last: false),
                //         SizedBox(
                //           width: 7,
                //         ),
                //         _textFieldOTP(first: true, last: false),
                //         SizedBox(
                //           width: 7,
                //         ),
                //         _textFieldOTP(first: true, last: true),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.60,
                  child: GridView.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1,
                    scrollDirection: Axis.vertical,
                    children: List<Container>.generate(
                      6,
                      (int index) => Container(
                        child: widgetList[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 190,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _onButtonClick();
                      // if (currController.text == "") {
                      //   Get.snackbar(
                      //     "Alert",
                      //     "Please Enter Valid Verification code",
                      //     titleText: Text(
                      //       "Alert",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //     messageText: Text(
                      //       "Please Enter Valid Verification code",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //     backgroundColor: changecolor.primary_dark,
                      //     borderRadius: 20,
                      //     margin: EdgeInsets.all(10),
                      //   );
                      // } else if (textController.isSeller == false) {
                      //   Get.put(SellerAuthController());
                      //   Get.to(StoreDetailsScreen(
                      //     number: widget.mobile,
                      //     code: widget.countrycode,
                      //   ));
                      // } else {
                      //   _onButtonClick();
                      //   // Get.to(BuyerSignUpScreen());
                      // }

                      // if (textController.isSeller.value == true) {

                      //   Get.to(SpalshScreen());
                      // } else {
                      //   Get.to(StoreDetailsScreen());
                      // }
                    },
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 20,
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

  // // _textFieldOTP({required bool first, last}) {
  // //   return Container(
  // //     decoration: BoxDecoration(),
  // //     child: AspectRatio(
  // //       aspectRatio: 1.0,
  // //       child: TextField(
  // //         autofocus: true,
  // //         onChanged: (value) {
  // //           if (value.length == 1 && last == false) {
  // //             FocusScope.of(context).nextFocus();
  // //           }
  // //           if (value.length == 1 && first == false) {
  // //             FocusScope.of(context).previousFocus();
  // //           }
  // //         },
  // //         showCursor: false,
  // //         readOnly: false,
  // //         textAlign: TextAlign.center,
  // //         style: TextStyle(
  // //           color: Colors.white,
  // //           fontSize: 20,
  // //           fontWeight: FontWeight.bold,
  // //         ),
  // //         keyboardType: TextInputType.number,
  // //         maxLength: 1,
  // //         decoration: InputDecoration(
  // //           counter: Offstage(),
  // //           enabledBorder: OutlineInputBorder(
  // //             borderRadius: BorderRadius.circular(10),
  // //             borderSide: BorderSide(width: 2.0, color: Colors.white),
  // //           ),
  // //           focusedBorder: OutlineInputBorder(
  // //             borderRadius: BorderRadius.circular(12),
  // //             borderSide: BorderSide(width: 2.0, color: Colors.white),
  // //           ),
  // //         ),
  // //       ),
  // //     ),
  // //   );
  // }

  void _verifyPhoneNumber() async {
    Changecolor changecolor = Changecolor();
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      Get.snackbar("Erorr", authException.message.toString());
      debugPrint(authException.code);
      // ignore: avoid_print
      print(authException.message);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, int forceResendingToken) async {
      print("codeSent");
      print(verificationId);

      Get.snackbar(
        "Alert",
        "Please check your phone for the verification code.",
        titleText: Text(
          "Alert",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        messageText: Text(
          "Please check your phone for the verification code.",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
        backgroundColor: changecolor.primary_dark,
        borderRadius: 20,
        margin: EdgeInsets.all(10),
      );
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // Utility.showToast(msg: "Code Auto Retrieval Timeout");
      print("codeAutoRetrievalTimeout");

      _verificationId = verificationId;
    };

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      print("verificationCompleted");
    };

    if (kIsWeb) {
      await sellerAuth.firebaseAuth
          .signInWithPhoneNumber(
        widget.countrycode + widget.mobile,
      )
          .then((value) {
        _verificationId = value.verificationId;
        print("then");
      }).catchError((onError) {
        print(onError);
      });
    } else {
      await sellerAuth.firebaseAuth
          .verifyPhoneNumber(
              phoneNumber: widget.countrycode + widget.mobile,
              timeout: const Duration(seconds: 60),
              verificationCompleted: verificationCompleted,
              verificationFailed: verificationFailed,
              codeSent: codeSent,
              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) {
        print("then");
      }).catchError((onError) {
        print(onError);
      });
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void deleteText() {
    if (currController.text.length == 0) {
    } else {
      currController.text = "";
      currController = controller3;
      return;
    }

    if (currController == controller1) {
      controller1.text = "";
    } else if (currController == controller2) {
      controller1.text = "";
      currController = controller1;
    } else if (currController == controller3) {
      controller2.text = "";
      currController = controller2;
    } else if (currController == controller4) {
      controller3.text = "";
      currController = controller3;
    } else if (currController == controller5) {
      controller4.text = "";
      currController = controller4;
    } else if (currController == controller6) {
      controller5.text = "";
      currController = controller5;
    }
  }

  _onButtonClick() {
    Changecolor changecolor = Changecolor();
    if (currController.text.trim() == "" ||
        controller1.text.trim() == "" ||
        controller2.text.trim() == "" ||
        controller3.text.trim() == "" ||
        controller4.text.trim() == "" ||
        controller5.text.trim() == "" ||
        controller6.text.trim() == "") {
      Get.snackbar(
        "Alert",
        "Please enter valid verification code.",
        titleText: Text(
          "Alert",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        messageText: Text(
          "Please Enter valid verification code",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
        backgroundColor: changecolor.primary_dark,
        borderRadius: 20,
        margin: EdgeInsets.all(10),
      );
    } else {
      verifyOtp(controller1.text.trim() +
          controller2.text.trim() +
          controller3.text.trim() +
          controller4.text.trim() +
          controller5.text.trim() +
          controller6.text.trim());
    }
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
