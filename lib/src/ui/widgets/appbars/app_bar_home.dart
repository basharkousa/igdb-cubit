import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/savedgamesscreen/saved_games_screen.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_screen.dart';
import 'package:igameapp/src/ui/widgets/buttons/button_rounded.dart';
import 'package:igameapp/src/ui/widgets/common/extentions.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget{
  final bool transparent;
  final String? title;
  final Color? backgroundColor;

  AppBarHome({super.key, this.transparent = false, this.title,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // backgroundColor: transparent ? Colors.transparent : backgroundColor??AppColors.lightBG,
      elevation: 0.2.h,
//      leading: SizedBox(child: Icon(Icons.arrow_back,color: Colors.white,),
//        height: 4,width: 4,),
      title: Padding(
        padding: EdgeInsets.only(top: 0.h),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ButtonRounded(icon: Icon(Icons.settings),).onClickBounce(() {
                        Get.toNamed(SettingsScreen.route);
                      }),
                      SizedBox(width: 10.w,),
                    ],)),
                Align(alignment: AlignmentDirectional.centerStart,child: Text(
                  title??"title",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    // color: Color(0xFF151515),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),),
              ],
            ),
            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
