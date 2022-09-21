// ignore_for_file: unused_import, file_names, unused_local_variable, prefer_const_constructors, duplicate_ignore, override_on_non_overriding_member, unused_field, deprecated_member_use, unused_element, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_string_interpolations, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_collection_literals

import 'dart:io';
import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/Listimages.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Models/product_model.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect/multiselect.dart';
import 'package:roadman_vegi/Screen/SellerdDawerScreen.dart';

class AddProductScreenTwo extends StatefulWidget {
  const AddProductScreenTwo({Key key}) : super(key: key);

  @override
  State<AddProductScreenTwo> createState() => _AddProductScreenTwoState();
}

class _AddProductScreenTwoState extends State<AddProductScreenTwo> {
  final productController = Get.put(ProductController());
  final sellerController = Get.put(SellerController());
  @override
  void initState() {
    Get.put(SellerAuthController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();

    Size width = MediaQuery.of(context).size;
    Size heigth = MediaQuery.of(context).size;
    bool selectedIndex = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 15.0,
        backgroundColor: changecolor.primary_color,
        leadingWidth: 90,
        title: Text(
          "میری مصنوعات",
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        toolbarHeight: 70,
        actions: [],
      ),
      body: Column(
        children: [
          Text(
            " اج کی سبزیوں کا انتخاب",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: GetX<ProductController>(
                init: Get.put<ProductController>(ProductController()),
                builder: (ProductController proController) {
                  if (proController != null && proController.products != null) {
                    return Container(
                      height: 589,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: proController.products.length,

                        itemBuilder: (context, index) {
                          return newMethod(
                              weight: proController.products[index].weight,
                              index: index,
                              productImage: proController.products[index].image,
                              productName: proController.products[index].name,
                              selectedIndex:
                                  proController.products[index].isSelected,
                              id: proController.products[index].id,
                              price: proController.products[index].price);
                        },

                        // crossAxisCount: 2,
                        // children: List.generate(productlist.length, (index) {
                        //   return

                        // }),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onPressed: () {
              if (productController.selecteditem.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select any one item")));
                print("empty");
              } else {
                sellerController
                    .saveProducts()
                    .then((value) => Get.to(SellerDrawerScreen()));
              }
            },
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding newMethod(
      {selectedIndex,
      productName,
      index,
      productImage,
      id,
      price,
      double weight}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            productController.products[index].isSelected =
                !productController.products[index].isSelected;

            if (productController.products[index].isSelected == true) {
              productController.selecteditem.add(ProductModel(
                id: id,
                image: productImage,
                isSelected: true,
                name: productName,
                price: price,
                weight: weight,
              ));
            } else if (productController.productlist[index].isSelected ==
                false) {
              productController.selecteditem.retainWhere((element) =>
                  element.name ==
                  productController.productlist[index].ProductName);
            }
            print(productController.productlist[index].isSelected);

            print(productController.selecteditem.length);
          });
        },
        child: Card(
          elevation: 10,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: selectedIndex == true ? Colors.green : Colors.red,
              width: 0.50,
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(
                  productImage,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 190,
                ),
                //  borderRadius: BorderRadius.circular(5),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      productName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.5),
                    ),
                    Spacer(),
                    selectedIndex
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green[700],
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.red,
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
