import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static Widget customButton({
    required String btnName,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 45.h,
      width: 300.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          btnName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Text customText({
    required String text,
    required double height,
    size,
    FontWeight? fontwght,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        height: height,
        fontWeight: fontwght ?? FontWeight.normal,
        color: color ?? Color(0XFF5E5E5E),
      ),
    );
  }

  static Widget dropDownBtn({
    required String dropdownInitialValue,
    double? width,
    Widget? widget,
    required List<String> list,
    required ValueChanged<String?>? onChange,
  }) {
    return SizedBox(
      width: width,
      child: DropdownButton<String>(
        isExpanded:width !=null? false: true,
        value: dropdownInitialValue,
        icon: widget,
        elevation: 16,
        underline: Container(
          height: 1.h,
          color: Color(0xFF00A884).withOpacity(0.3),
        ),
        onChanged: onChange,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: UiHelper.customText(
              text: value,
              height: 0,
              size: 14.sp,
              fontwght: FontWeight.w400,
            ),
          );
        }).toList(),
      ),
    );
  }
}
