import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ButtonRounded extends StatelessWidget {
  Icon? icon;
   ButtonRounded({super.key,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: ShapeDecoration(
        // color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFE7E7E7),
          ),
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
      child: icon?? Icon(
        Icons.arrow_back_outlined,
        size: 20.w,
        // color: Get.theme.colorScheme.secondary,
      ),
    );
  }
}
