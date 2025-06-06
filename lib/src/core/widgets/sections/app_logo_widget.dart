import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/core/utils/extensions.dart';
import '../../../../../generated/assets.gen.dart';

class AppLogoSection extends StatelessWidget {
  const AppLogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156.w,
      height: 107.09.h,
      child:  context.isDarkMode?
      Center(child: Image.asset(Assets.images.icAppLauncher.path),):
      Center(child: Image.asset(Assets.images.icAppLauncher.path,),),
    );
  }
}
