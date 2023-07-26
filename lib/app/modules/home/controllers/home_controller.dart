import 'package:flutter/material.dart';
import 'package:fortune4_kyc_app/app/data/size.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    initializeHeightAndWidth();
    super.onReady();
  }

  // Initialize height and width
  void initializeHeightAndWidth() {
    height = MediaQuery.of(Get.context!).size.height;
    width = MediaQuery.of(Get.context!).size.width;
  }

  // Navigate to
  void navigateTo() {}
}
