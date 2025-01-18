import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonDefault extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String? title;

  final bool noMargin;

  ButtonDefault(
      {super.key,
      this.backgroundColor,
      this.textColor,
      this.title,
      this.noMargin = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 52.h,
      margin: noMargin
          ? null
          : EdgeInsetsDirectional.only(bottom: 16.h, end: 16.h, start: 16.h),
      padding: EdgeInsets.all(10.h),
      decoration: ShapeDecoration(
        color: backgroundColor ??  Color(0xFF151515),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Center(
        child: Text(
          title ?? 'DefaultButton',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
