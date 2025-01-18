import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.gen.dart';

class BackGroundThemeWidget extends StatelessWidget {
  const BackGroundThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Get.isDarkMode
        ? Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.19, 0.98),
            end: Alignment(0.19, -0.98),
            colors: [
              Color(0x8E151515),
              Color(0xE0151515),
              Color(0xFF151515)
            ],
          ),
        ))
        : Image.asset(
      Assets.images.ivBlurLight.path,
      fit: BoxFit.cover,
      width: Get.width,
      height: Get.height,
    );
  }
}
