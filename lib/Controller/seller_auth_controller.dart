import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/seller_model.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:roadman_vegi/Screen/StoreDetailsScreen.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

final SellerController sellerController = Get.put(SellerController());

class SellerAuthController extends GetxController {
  final Rx<User> _firbaseUser = Rx<User>();
  User get user => _firbaseUser.value;
  Rx<SellerModel> sellerModel = SellerModel().obs;
  SellerModel get seller => sellerModel.value;
  set seller(SellerModel value) => sellerModel.value = value;
  final firebaseAuth = FirebaseAuth.instance;
  @override
  void onInit() {
    _firbaseUser.bindStream(firebaseAuth.authStateChanges());

    //print("Id : ${firebaseAuth.currentUser!.uid}");
    super.onInit();
  }

  void getSeller() async {
    seller = await getVendorShop();
  }

  Future<SellerModel> getVendorShop() async {
    // \\\print("user id ${userController.firbaseUser.value.uid}");
    try {
      //  print("Get function uid $uid");
      DocumentSnapshot doc = await fireStore
          .collection('Seller_store')
          .doc(firebaseAuth.currentUser.uid)
          .get();
      return SellerModel.fromdocumentsnapshot(doc);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      rethrow;
    }
  }

  Future<int> isUserExists() {
    // print("enter in all user stream funtion ${phoneNoController.text}");

    var len = FirebaseFirestore.instance
        .collection('Seller_store')
        .where('contactNo', isEqualTo: user.phoneNumber)
        .snapshots()
        .map((QuerySnapshot query) {
      print('lisssst');
      List retVal = List();
      query.docs.forEach((element) {
        retVal.add(element);
      });
      if (retVal.isNotEmpty) {
        // authController.phoneNoController.clear();
        return Get.offAll(AddProductScreen());
      } else {
        Get.offAll(StoreDetailsScreen(
          code: user.phoneNumber,
        ));
      }
    });
    return len.length;
  }

  Future getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    sellerController.latitude.value = _locationData.latitude;
    sellerController.longitude.value = _locationData.longitude;

    // From coordinates
    final coordinates =
        Coordinates(_locationData.latitude, _locationData.longitude);
    var _addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var shopAddress = _addresses.first;
    sellerController.shopAddress = shopAddress.addressLine;
    sellerController.placeName = shopAddress.featureName;
    print("Shop name is ${sellerController.placeName}");
    return shopAddress;
  }
}
