import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:igameapp/src/core/configs/theme/app_theme.dart';
import 'package:igameapp/src/core/configs/theme/colors.dart';
import 'package:igameapp/src/core/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/appcubit/app_cubit.dart';
import 'package:igameapp/src/appcubit/app_state.dart';
import 'package:igameapp/src/core/di/getit/injection.dart';
import 'package:igameapp/src/core/presentation/screens/settingscreen/cubit/setting_state.dart';
import 'package:igameapp/src/core/presentation/screens/settingscreen/cubit/settings_cubit.dart';
import 'package:igameapp/src/core/presentation/widgets/appbars/app_bar_default.dart';
import 'package:igameapp/src/core/presentation/widgets/buttons/button_default.dart';
import 'package:igameapp/src/core/presentation/widgets/common/extentions.dart';
import 'package:igameapp/src/core/utils/extensions.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = "/SettingsScreen";

  final SettingsCubit cubit;

  const SettingsScreen(this.cubit,{super.key,});

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
            onRefresh: cubit.onRefresh,
            color: context.colorScheme.secondary,
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
                                color: state.locale.languageCode =="nl"? Colors.black:null,
                                onPressed: () {
                                  getIt<AppCubit>().changeLanguage('nl');
                                },
                                child: Text(
                                  "Dutch",
                                  style: TextStyle(color: Colors.grey),
                                )),
                            // SizedBox(
                            //   width: 10.w,
                            // ),
                            // MaterialButton(
                            //     color: state.locale.languageCode=="ar"? Colors.black:null,
                            //     onPressed: () {
                            //       getIt<AppCubit>().changeLanguage('ar');
                            //     },
                            //     child: Text(
                            //       "العربية",
                            //       style: TextStyle(color: Colors.grey),
                            //     )),
                          ],
                        );
                      })
                    ),
                    SizedBox(height: 48.h,),
                    ButtonDefault(title: context.l.remove_games,).onClickBounce((){
                      cubit.removeGames();
                    })
                  ],
                )),
          ),
        ),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  buildChangeAppThemeWidget() {
    return BlocProvider.value(
        value: cubit,
        child: BlocBuilder<SettingsCubit,SettingState>(builder: (context,state){
          return SizedBox(
            height: 50.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ThemeModel themeModel = cubit.state.themes[index];
                  return GestureDetector(
                    onTap: () {
                      cubit.onColorItemClick(themeModel);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: ShapeDecoration(
                        color: themeModel.color,
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 3.w,
                            color: themeModel.isSelected??false
                                ? AppColors.lightAccent
                                : AppColors.lightGray2,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: 10.w,
                  );
                },
                itemCount: cubit.state.themes.length),
          );
        }),);
  }
}
