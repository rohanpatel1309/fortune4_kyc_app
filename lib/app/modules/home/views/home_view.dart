import 'package:flutter/material.dart';
import 'package:fortune4_kyc_app/app/data/size.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  // body
  Widget _getBody() {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          // info widget
          _getInfoWidget(),

          // agree and continue button
          _getAgreeAndContinueButton(),
        ],
      ),
    );
  }

  // info widget
  Widget _getInfoWidget() {
    return Column(
      children: [],
    );
  }

  // agree and continue button
  Widget _getAgreeAndContinueButton() {
    return GestureDetector(
      onTap: controller.navigateTo,
      child: Container(
        height: height * 0.1,
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.1, vertical: height * 0.05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.purple),
        child: Text(
          "Agree and Continue",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
