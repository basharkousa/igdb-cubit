import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:igameapp/src/core/configs/navigation/extension.dart';
import 'package:igameapp/src/core/di/getit/injection.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/games_screen.dart';
import 'package:igameapp/src/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:igameapp/src/core/widgets/common/state_ful_wrapper.dart';
import 'package:igameapp/src/core/utils/extensions.dart';
import '../../../core/widgets/sections/app_logo_widget.dart';
import '../../../core/widgets/sections/background_theme_widget.dart';

class SplashScreenPage extends StatelessWidget {
  static const String route = "/";

  final SplashCubit splashCubit = getIt<SplashCubit>();

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
                            switch (state) {
                              case SplashInitial():
                                return buildLoadingGamesWidget(context);
                              case SplashLoading():
                                return buildLoadingGamesWidget(context);
                              case SplashSuccess():
                                return StatefulWrapper(
                                  onInit: (){
                                    goToHomeScreen(context);
                                  },
                                  child: Container(),
                                );
                              case SplashError():
                                return Container();
                              default:
                                return buildLoadingGamesWidget(context);
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
                        context.l.explore_your_interesting_games,
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

  Future<void> goToHomeScreen(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.navigateAndRemoveUntil(GamesScreen.route,
          predicate: (route) => false);
    });
    // context.goNamed(HomeScreen.route,);
    // Get.offNamed(HomeScreen.route);
  }

  Widget buildLoadingGamesWidget(BuildContext context) {
    return SpinKitCircle(
      color: context.isDarkMode ? Colors.white : Colors.black,
      // color: Colors.red,
      size: 32.h,
    );
  }
}
