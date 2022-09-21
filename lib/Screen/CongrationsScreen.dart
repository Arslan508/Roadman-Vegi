// ignore_for_file: unused_import, file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:roadman_vegi/Screen/SellerdDawerScreen.dart';

class CongrationsScreen extends StatefulWidget {
  const CongrationsScreen({Key key}) : super(key: key);

  @override
  State<CongrationsScreen> createState() => _CongrationsScreenState();
}

class _CongrationsScreenState extends State<CongrationsScreen> {
  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/congrations.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Congratulations!",
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
                    "Your Web Store has been created",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 190,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.to(SellerDrawerScreen());
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
