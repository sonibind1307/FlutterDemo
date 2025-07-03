import 'package:flutter/material.dart';

import '../../core/app_color.dart';


class CustomTextStyle {
  static Widget extraBold({String? text, double? fontSize, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }

  static Widget bold({String? text, double? fontSize, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: color,
          fontFamily: "Poppins"),
      softWrap: false,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget underLine({String? text, double? fontSize, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
          color: color ?? Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          decoration: TextDecoration.underline),
      softWrap: false,
    );
  }

  static Widget semiBold({String? text, double? fontSize, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget extraBoldSelectable(
      {String? text, double? fontSize, Color? color}) {
    return SelectionArea(
      child: Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }

  static Widget semiBoldSelectable(
      {String? text, double? fontSize, Color? color}) {
    return SelectionArea(
      child: Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget boldSelectable({String? text, double? fontSize, Color? color}) {
    return SelectionArea(
      child: Text(
        text!,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: color,
            fontFamily: "Poppins"),
        softWrap: false,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget boldSelectable1(
      {String? text, double? fontSize, Color? color}) {
    return SelectionArea(
      child: Text(
        text!,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: color,
            fontFamily: "Poppins"),
        softWrap: false,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget regularSelectable({
    String? text,
    double? fontSize,
    Color? color,
    int? maxLines,
    bool? isJustify,
  }) {
    return SelectionArea(
      child: isJustify == true
          ? Text(
              textAlign: TextAlign.start,
              text!,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: fontSize ?? 14,
                color: color ?? AppColors.dataCellColor,
              ),
              maxLines: maxLines,
            )
          : Text(
              text!,
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                fontSize: fontSize ?? 14,
                color: color ?? AppColors.dataCellColor,
              ),
              maxLines: maxLines,
            ),
    );
  }

  static Widget regular({
    String? text,
    double? fontSize,
    Color? color,
    int? maxLines,
    bool? isJustify,
  }) {
    return Text(
      // textAlign: isJustify ? TextAlign.justify : TextAlign.start,
      text!,
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.dataCellColor,
      ),
      maxLines: maxLines,
    );
  }
}
