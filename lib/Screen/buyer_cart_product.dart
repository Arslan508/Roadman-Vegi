// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/add_cart_controller.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Models/add_cart_model.dart';
import 'package:roadman_vegi/Models/product_model.dart';
import 'package:roadman_vegi/Screen/buyer_product_detail.dart';
import 'package:roadman_vegi/Screen/cash_on_hand.dart';

class BuyerCartScreen extends StatefulWidget {
  BuyerCartScreen({Key key, this.product, this.sellerId, this.qty, this.total})
      : super(key: key);
  final ProductModel product;
  final RxDouble qty;
  final RxDouble total;

  final String sellerId;

  @override
  State<BuyerCartScreen> createState() => _BuyerCartScreenState();
}

class _BuyerCartScreenState extends State<BuyerCartScreen> {
  List<AddCartModel> cartlist = <AddCartModel>[];

  final RxBool selected = false.obs;

  final AddCartController addCartController = Get.put(AddCartController());

  final BuyerAuthController buyerAuthController =
      Get.put(BuyerAuthController());

  @override
  Widget build(BuildContext context) {
    var number = cartlist;
    var total = 0.0;
    total = number.fold(0, (a, b) => a + b.productPrice);

    return SafeArea(
      child: Scaffold(
        bottomSheet: SizedBox(
          width: MediaQuery.of(context).size.width - 5,
          height: 50,
          child: Center(
            child: ElevatedButton(
                onPressed: () async {
                  if (addCartController != null) {
                    await addCartController.checkOut(
                      sellerId: widget.sellerId,
                      buyerNo: buyerAuthController.buyer.contactNo,
                      buyerAddress: buyerAuthController.buyer.buyerAdress,
                      buyerName: buyerAuthController.buyer.firstName,
                      productImg: cartlist,
                      productName: cartlist,
                      productWeight: cartlist,
                      productsid: cartlist,
                      productPrice: cartlist,
                      selectedQuantity: cartlist,
                    );
                    Get.to(CashOnHand());
                  } else {
                    Get.snackbar("Alert", "Please select one item ");
                  }
                },
                child: Text("Rs : $total  Check out")),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
              //  Get.to(BuyerProdcutDetail());
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
              "Cart Detail",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: GetX<AddCartController>(
              init: Get.put<AddCartController>(AddCartController()),
              builder: (AddCartController addCartController) {
                if (addCartController != null &&
                    addCartController.addcardlist.value != null) {
                  return Container(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: addCartController.addcardlist.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                addCartController
                                        .addcardlist.value[index].isSelected =
                                    !addCartController
                                        .addcardlist.value[index].isSelected;
                                if (addCartController
                                        .addcardlist.value[index].isSelected ==
                                    true) {
                                  cartlist.add(AddCartModel(
                                      isSelected: true,
                                      productId: addCartController
                                          .addcardlist.value[index].productId,
                                      productImg: addCartController
                                          .addcardlist.value[index].productImg,
                                      productName: addCartController
                                          .addcardlist.value[index].productName,
                                      productPrice: addCartController
                                          .addcardlist
                                          .value[index]
                                          .productPrice,
                                      productWeight: addCartController
                                          .addcardlist
                                          .value[index]
                                          .productWeight,
                                      selectedQuantity: addCartController
                                          .addcardlist
                                          .value[index]
                                          .selectedQuantity));
                                } else if (addCartController
                                        .addcardlist.value[index].isSelected ==
                                    false) {
                                  cartlist.removeWhere((element) =>
                                      element.productId ==
                                      cartlist[index].productId);
                                }
                                selected.value = addCartController
                                    .addcardlist.value[index].isSelected;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 5,
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    trailing: addCartController.addcardlist
                                                .value[index].isSelected ==
                                            true
                                        ? Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.check_circle,
                                            color: Colors.grey,
                                          ),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        addCartController.addcardlist
                                            .value[index].productImg,
                                      ),
                                    ),
                                    title: Text(
                                      addCartController
                                          .addcardlist.value[index].productName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          addCartController.addcardlist
                                              .value[index].productPrice
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "${addCartController.addcardlist.value[index].selectedQuantity} Kg"
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
