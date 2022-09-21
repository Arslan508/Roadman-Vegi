import 'package:flutter/material.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Screen/seller_login.dart';
import 'package:get/get.dart';

class RootSeller extends StatelessWidget {
  RootSeller({Key key}) : super(key: key);
  final authController = Get.put<SellerAuthController>(SellerAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SellerAuthController>(
        initState: (_) {
          Get.put<SellerAuthController>(SellerAuthController());
        },
        builder: (_) {
          if (Get.find<SellerAuthController>().user != null) {
            authController.isUserExists();
            //  print('num is: ${authController.user.phoneNumber.toString()} ');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Loading...', style: TextStyle(fontSize: 14))
                ],
              ),
            );
          } else
            return Login();
        },
      ),
    );
  }
}
