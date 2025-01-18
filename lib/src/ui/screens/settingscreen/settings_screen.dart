import 'package:get/get.dart';
import 'package:igameapp/generated/locales.g.dart';
import 'package:igameapp/src/configs/app_theme.dart';
import 'package:igameapp/src/configs/colors.dart';
import 'package:igameapp/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_controller.dart';
import 'package:igameapp/src/ui/widgets/appbars/app_bar_default.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  static const String route = "/SettingsScreen";

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: LocaleKeys.settings.tr,
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
              start: Dimens.mainMargin, end: Dimens.mainMargin),
          child: RefreshIndicator(
            onRefresh: controller.onRefresh,
            color: Get.theme.colorScheme.secondary,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 16.h,
                    ),
                    buildChangeAppThemeWidget(),
                    SizedBox(
                      height: 48.h,
                    ),
                  ],
                )),
          ),
        ),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  buildChangeAppThemeWidget() {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() {
              ThemeModel themeModel = controller.themeModelList[index];
              return GestureDetector(
                onTap: (){
                  controller.onColorItemClick(themeModel);
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: ShapeDecoration(
                    color: themeModel.color,
                    shape: CircleBorder(
                      side: BorderSide(
                        width: 3.w,
                        color: themeModel.isSelected.value
                            ?  AppColors.lightAccent
                            : AppColors.lightGray2,
                      ),
                    ),
                  ),
                ),
              );
            });
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 10.w,
            );
          },
          itemCount: controller.themeModelList.length),
    );
  }

}
