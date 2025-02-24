import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/ui/widgets/buttons/button_rounded.dart';
import 'package:igameapp/src/ui/widgets/common/extentions.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget{
  final bool transparent;
  final String? title;
  final Color? backgroundColor;
  final Function? onSettingClick;
  final Function? onHistoryClick;

  const AppBarHome({super.key, this.transparent = false, this.title,this.backgroundColor,this.onSettingClick,this.onHistoryClick});

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
            Row(
              // alignment: AlignmentDirectional.center,
              children: [
                Expanded(
                  // alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    title??"title",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      // color: Color(0xFF151515),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),),
                SizedBox(width: 4.w,),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ButtonRounded(icon: Icon(Icons.settings),).onClickBounce(() {
                        (onSettingClick ?? () {})();
                      }),
                      SizedBox(width: 8.w,),
                      ButtonRounded(icon: Icon(Icons.history),).onClickBounce(() {
                        (onHistoryClick??(){})();
                      }),
                      SizedBox(width: 2.w,),
                    ],)),
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

