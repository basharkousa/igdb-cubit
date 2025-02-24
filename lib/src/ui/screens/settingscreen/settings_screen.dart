import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:igameapp/generated/locales.g.dart';
import 'package:igameapp/src/configs/app_theme.dart';
import 'package:igameapp/src/configs/colors.dart';
import 'package:igameapp/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/controllers/cubit/app_cubit.dart';
import 'package:igameapp/src/controllers/cubit/app_state.dart';
import 'package:igameapp/src/di/getit/injection.dart';
import 'package:igameapp/src/ui/screens/settingscreen/settings_controller.dart';
import 'package:igameapp/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:igameapp/src/utils/extensions.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = "/SettingsScreen";

  final SettingsController controller = getIt<SettingsController>();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: context.l.settings,
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
                    BlocProvider.value(
                      value: getIt<AppCubit>(),
                      child: BlocBuilder<AppCubit,AppState>(
                          builder: (c,state){
                        return Row(
                          children: [
                            MaterialButton(
                                color:state.locale.languageCode=="en"? Colors.black:null,
                                onPressed: () {
                                  getIt<AppCubit>().changeLanguage('en');
                                },
                                child: Text(
                                  "English",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            MaterialButton(
                                color: state.locale.languageCode=="nl"? Colors.black:null,
                                onPressed: () {
                                  getIt<AppCubit>().changeLanguage('nl');
                                },
                                child: Text(
                                  "Dutch",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            MaterialButton(
                                color: state.locale.languageCode=="ar"? Colors.black:null,
                                onPressed: () {
                                  getIt<AppCubit>().changeLanguage('ar');
                                },
                                child: Text(
                                  "العربية",
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        );
                      })
                    )
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
                onTap: () {
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
                            ? AppColors.lightAccent
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
