// ignore_for_file: unused_import, non_constant_identifier_names, file_names

import 'package:flutter/material.dart' show IconData;
import 'package:get/get.dart';

class Listimages {
  final String ProductName;
  final IconData Select_Icon;
  final String ProductImage;
  final String ProductDetails;
  bool isSelected;
  final int id;
  final double price;

  Listimages(
      {this.ProductImage,
      this.isSelected,
      this.ProductName,
      this.Select_Icon,
      this.ProductDetails,
      this.id,
      this.price});
}
