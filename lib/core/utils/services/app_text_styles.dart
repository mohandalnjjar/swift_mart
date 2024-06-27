import 'package:flutter/material.dart';
import 'package:swift_mart/core/functions/get_responsive_font_size.dart';

abstract class AppStyles {
  // SemiBold styles
  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 16, context: context),
    );
  }

  static TextStyle styleSemiBold17(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 17, context: context),
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleSemiBold19(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 19, context: context),
    );
  }

  static TextStyle styleSemiBold21(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 21, context: context),
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 24, context: context),
    );
  }

  static TextStyle styleSemiBold25(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 25, context: context),
    );
  }

  static TextStyle styleSemiBold30(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 30, context: context),
    );
  }

  static TextStyle styleSemiBold41(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsizeFontSize(fontSize: 41, context: context),
    );
  }

  // Regular styles
  static TextStyle styleRegular15(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 15, context: context),
    );
  }

  static TextStyle styleRegular17(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 17, context: context),
    );
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 18, context: context),
    );
  }

  static TextStyle styleRegular21(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 21, context: context),
    );
  }

  static TextStyle styleRegular22(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 22, context: context),
    );
  }

  static TextStyle styleRegular23(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 23, context: context),
    );
  }

  static TextStyle styleRegular24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 24, context: context),
    );
  }

  // Bold styles
  static TextStyle styleBold27(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: getResponsizeFontSize(fontSize: 27, context: context),
    );
  }

  static TextStyle styleBold(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: getResponsizeFontSize(fontSize: 20, context: context),
    );
  }

  // Specific weight styles
  static TextStyle style700w14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: getResponsizeFontSize(fontSize: 14, context: context),
    );
  }

  static TextStyle style700w16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: getResponsizeFontSize(fontSize: 16, context: context),
    );
  }

  // Grey styles
  static TextStyle styleGreyReg16(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: getResponsizeFontSize(fontSize: 16, context: context),
    );
  }
}
