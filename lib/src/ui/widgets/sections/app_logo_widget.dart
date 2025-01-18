import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.gen.dart';

class AppLogoSection extends StatelessWidget {
  const AppLogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156.w,
      height: 107.09.h,
      child:  Get.isDarkMode?
      Center(child: Image.asset(Assets.images.icAppLauncher.path),):
      Center(child: Image.asset(Assets.images.icAppLauncher.path,),),
    );
  }
}
