import 'package:flutter/material.dart';
import 'package:swift_mart/core/functions/get_responsive_font_size.dart';

abstract class AppStyles {
  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 24, context: context),
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleSemiBold17(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsizeFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleSemiBold21(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsizeFontSize(fontSize: 21, context: context),
    );
  }

  static TextStyle styleSemiBold19(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsizeFontSize(fontSize: 19, context: context),
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsizeFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleSemiBold27(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 27, context: context),
    );
  }

  static TextStyle styleSemiBold41(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 41, context: context),
    );
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleRegular23(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 23, context: context),
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleRegular17(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 17, context: context),
    );
  }

  static TextStyle styleRegular15(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 15, context: context),
    );
  }

  static TextStyle styleBold(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: getResponsizeFontSize(fontSize: 20, context: context),
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.grey,
      fontSize: getResponsizeFontSize(fontSize: 14, context: context),
    );
  }
}
