import 'package:flutter/material.dart';
import 'package:fortune4_kyc_app/app/data/size.dart';
import 'package:fortune4_kyc_app/app/data/styles.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // initialize height and width
    controller.initializeHeightAndWidth();

    return Scaffold(
      body: _getBody(),
    );
  }

  // body
  Widget _getBody() {
    return Container(
      color: Colors.grey.shade200,
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.05),
      child: Column(
        children: [
          // details
          _detailsWidget(),

          // terms of use and service widget
          _termsOfUseAndPrivacyPolicyWidget(),
        ],
      ),
    );
  }

  // agree and continue button
  Widget _getAgreeAndContinueButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: controller.navigateTo,
        child: Container(
          height: height * 0.065,
          width: width,
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.deepPurple),
          child: Center(
            child: Text(
              "Agree and Continue",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // terms of use and service widget
  Widget _termsOfUseAndPrivacyPolicyWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.015),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 5.0, offset: Offset(0.0, 0.75))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // checkbox
          _getCheckBoxWidget(),

          SizedBox(
            width: width * 0.04,
          ),

          // terms of use text
          _termsOfUseText(),
        ],
      ),
    );
  }

  // checkbox
  Widget _getCheckBoxWidget() {
    return Container(
      height: height * 0.025,
      width: height * 0.025,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: Colors.black)),
      child: Center(
        child: Icon(Icons.check_rounded, size: 14),
      ),
    );
  }

  // terms of use text
  Widget _termsOfUseText() {
    return Flexible(
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: "By Clicking the above, I agree with Briskpe",
          style: Styles.textStyleNormal.copyWith(fontWeight: FontWeight.w300),
        ),
        TextSpan(
          text: " Terms of Use",
          style: Styles.textStyleMedium.copyWith(fontWeight: FontWeight.w700),
        ),
        TextSpan(
          text: " and",
          style: Styles.textStyleNormal.copyWith(fontWeight: FontWeight.w300),
        ),
        TextSpan(
          text: " Privacy Policy.",
          style: Styles.textStyleMedium.copyWith(fontWeight: FontWeight.w700),
        ),
      ])),
    );
  }

  // details
  Widget _detailsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 5.0, offset: Offset(0.0, 0.75)),
        ],
      ),
      child: Column(
        children: [
          // complete your KYC text
          _completeYourKYCText(),

          _getDetailsCard(
            title: "What to keep handly?",
            childWidget: _businessDetailsWidget(),
          ),

          _getDetailsCard(
            title: "What do we need KYC?",
            childWidget: _whyWeNeedKYCWidget(),
          ),
        ],
      ),
    );
  }

  // complete your KYC text
  Widget _completeYourKYCText() {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(children: [
          TextSpan(
            text: "Complete Your ",
            style: Styles.textStyleBold,
          ),
          TextSpan(
            text: "KYC",
            style: Styles.textStyleBold.copyWith(color: Colors.purple),
          ),
          TextSpan(
            text: " and Get your international account in ",
            style: Styles.textStyleBold,
          ),
          TextSpan(
            text: "just 5 mins!",
            style: Styles.textStyleBold.copyWith(color: Colors.purple),
          ),
        ]));
  }

  // details card
  Widget _getDetailsCard({required String title, required Widget childWidget}) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.025,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyleBold,
          ),
          childWidget,
        ],
      ),
    );
  }

  // business details
  Widget _businessDetailsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.064, top: height * 0.02, bottom: height * 0.005),
          child: Text(
            "Business details",
            style: Styles.textStyleMedium
                .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        _getIconWithText(text: "Business Pan"),
        SizedBox(
          height: height * 0.01,
        ),
        _getIconWithText(text: "Business bank account number and IFSC code"),
      ],
    );
  }

  // icon with text
  Widget _getIconWithText({required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.05,
          height: width * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
          ),
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 10,
          ),
        ),
        SizedBox(
          width: width * 0.015,
        ),
        Flexible(
            child: Text(
          text,
          style: Styles.textStyleNormal,
        )),
      ],
    );
  }

  // why we need KYC card
  Widget _whyWeNeedKYCWidget(){
    return Padding(
      padding: EdgeInsets.only(top: width * 0.015),
      child: _getIconWithText(text: "RBI mandates company verification of customers engaging in cross border payments."),
    );
  }
}
