// ignore_for_file: file_names, unused_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names, annotate_overrides, unused_element
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Screen/first_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  void initState() {
    FirstDisplay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/splashlogo.png',
          width: 280.0,
        ),
      ),
    );
  }
}

FirstDisplay() {
  Timer(const Duration(milliseconds: 3000), () {
    Get.off(const LoginScreen());
  });
}
