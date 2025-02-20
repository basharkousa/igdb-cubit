import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/home_screen.dart';
import 'package:igameapp/src/ui/screens/getstartedscreens/splashscreen/cubit/splash_cubit.dart';
import 'package:igameapp/src/ui/widgets/common/state_ful_wrapper.dart';
import '../../../../../generated/locales.g.dart';
import '../../../widgets/common/getx_state_widget.dart';
import '../../../widgets/sections/app_logo_widget.dart';
import '../../../widgets/sections/background_theme_widget.dart';

class SplashScreenPage extends StatelessWidget {
  static const String route = "/";

  final SplashCubit splashCubit = Get.find();

  SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          // backgroundColor: Colors.black,
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const BackGroundThemeWidget(),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   AppLogoSection(),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 34.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocProvider(
                        create: (context) => splashCubit,
                        child: BlocBuilder<SplashCubit, SplashState>(
                          builder: (context, state) {
                            switch (state.runtimeType) {
                              case SplashInitial:
                                return buildLoadingGamesWidget();
                              case SplashLoading:
                                return buildLoadingGamesWidget();
                              case SplashSuccess:
                                return StatefulWrapper(onInit: (){

                                }, child: Container(),);
                              case SplashError:
                                return Container();
                              default:
                                return buildLoadingGamesWidget();
                            }
                          },
                        ),
                      ),
                     /* GetXStateWidget(
                        snapshotLiveData: controller.loginResponseLiveData,
                        loadingWidget: SpinKitCircle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          // color: Colors.red,
                          size: 32.h,
                        ),
                      ),*/
                      SizedBox(
                        height: 21.h,
                      ),
                      Text(
                        LocaleKeys.explore_your_interesting_games.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          // fontFamily: FontFamily.montserrat,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goToHomeScreen() async {
    Get.offNamed(HomeScreen.route);
  }

  Widget buildLoadingGamesWidget() {
    return SpinKitCircle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      // color: Colors.red,
      size: 32.h,
    );
  }
}