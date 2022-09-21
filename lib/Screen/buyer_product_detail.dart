// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/add_cart_controller.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Models/product_model.dart';
import 'package:roadman_vegi/Screen/buyer_cart_product.dart';
import 'package:roadman_vegi/Screen/buyer_show_product_drawer.dart';

class BuyerProdcutDetail extends StatefulWidget {
  const BuyerProdcutDetail({Key key, this.products, this.sellerId})
      : super(key: key);
  final ProductModel products;
  final String sellerId;

  @override
  State<BuyerProdcutDetail> createState() => _BuyerProdcutDetailState();
}

class _BuyerProdcutDetailState extends State<BuyerProdcutDetail> {
  @override
  void initState() {
    addCartController.getCart();
    // TODO: implement initState
    super.initState();
  }

  final AddCartController addCartController = Get.put(AddCartController());

  final BuyerAuthController buyerAuthController =
      Get.put(BuyerAuthController());
  RxDouble qty = 1.0.obs;
  @override
  Widget build(BuildContext context) {
    RxDouble total = 0.0.obs;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.to(SellerProducts(
                sellerId: widget.sellerId,
                products: widget.products,
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          elevation: 5.0,
          title: Center(
            child: Text(
              "Products Detail",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.cart,
                color: Colors.black,
              ),
              onPressed: () {
                Get.put(AddCartController());
                Get.to(BuyerCartScreen(
                  qty: qty,
                  total: total,
                  product: widget.products,
                  sellerId: widget.sellerId,
                ));
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Image.network(
                    widget.products.image,
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.products.name.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (qty.value <= 0) {
                              Get.snackbar("Alert", "Least value is 1");
                            } else {
                              qty.value--;
                            }
                          },
                          icon: Icon(
                            CupertinoIcons.minus,
                            size: 20,
                          )),
                      Obx(
                        () => Text(
                          "${qty.value} Kg",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            if (qty.value <= widget.products.weight) {
                              qty.value++;
                            }
                          },
                          icon: Icon(
                            CupertinoIcons.add,
                            size: 20,
                          )),
                    ],
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Text(
                    "Price: ${widget.products.price}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Text(
                    "Total : ${total.value = qty.value * widget.products.price} "),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(onPressed: () {}, child: Text("+")),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      print(total.value);
                      await buyerAuthController.getBuyer();
                      addCartController
                          .addcart(
                              productImg: widget.products.image,
                              productName: widget.products.name,
                              productPrice: total.value,
                              productWeight: widget.products.weight,
                              productsid: widget.products.id,
                              selectedQuantity: qty.value,
                              sellerId: widget.sellerId,
                              buyerAddress:
                                  buyerAuthController.buyer.buyerAdress,
                              buyerName: buyerAuthController.buyer.firstName,
                              buyerNo: buyerAuthController.buyer.contactNo)
                          .then((value) =>
                              Get.snackbar("Success", "Your Product Added"));
                    },
                    child: Text(
                      "Add Cart",
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // ElevatedButton(onPressed: () {}, child: Text("-"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
