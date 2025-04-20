import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:igameapp/generated/assets.gen.dart';
import 'package:igameapp/src/core/configs/navigation/extension.dart';
import 'package:igameapp/src/core/utils/basic_tools.dart';
import 'package:igameapp/src/core/widgets/buttons/button_default.dart';
import 'package:igameapp/src/core/widgets/common/default_textfield_widget.dart';
import 'package:igameapp/src/core/widgets/common/extentions.dart';
import 'package:igameapp/src/core/widgets/sections/app_logo_widget.dart';
import 'package:igameapp/src/core/widgets/sections/background_theme_widget.dart';
import 'package:igameapp/src/features/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/games_screen.dart';
import 'package:igameapp/src/core/utils/extensions.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/Login";

  final LoginCubit cubit;

  const LoginScreen({super.key, required this.cubit});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = GlobalKey<FormState>();
  FocusNode clientIdFocusNode = FocusNode();
  FocusNode clientSecretFocusNode = FocusNode();

  ScrollController scrollController = ScrollController();

  TextEditingController clientIdEditingController = TextEditingController();
  TextEditingController clientSecretEditingController = TextEditingController();

  @override
  void initState() {
    clientIdEditingController.text = "e4040oh03abkhkgj5lm4zxt2uaetwj";
    clientSecretEditingController.text = "gjegyegavt770s288il8vlrdu41f78";
    super.initState();
  }

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
                children: [],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 34.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLogoSection(),
                      /*  BlocProvider(
                          create: (context) => widget.cubit,
                          child: BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              switch (state) {
                                case LoginInitial():
                                  return buildContent(context);
                                case LoginLoading():
                                  return buildLoadingGamesWidget(context);
                                case LoginSuccess():
                                  BasicTools.showToastMessage(state.loginResponse?.accessToken??"Bad Response");
                                  return buildContent(context);
                                case LoginError():
                                  BasicTools.showToastMessage(state.message);
                                  return buildContent(context,);
                              }
                            },
                          ),
                        ),*/
                        BlocProvider(
                          create: (context) => widget.cubit,
                          child: BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              // Handle all side effects here
                              if (state is LoginSuccess) {
                                BasicTools.showToastMessage(
                                    state.loginResponse?.accessToken ?? "Bad Response");
                                _navigateToHomeScreen(context);
                              } else if (state is LoginError) {
                                BasicTools.showToastMessage(state.message);
                              }
                            },
                            builder: (context, state) {
                              // Pure UI building - no side effects
                              if (state is LoginLoading) {
                                return buildLoadingGamesWidget(context);
                              }
                              // All other states show the same content
                              return buildContent(context);
                            },
                          ),
                        ),
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
  void _navigateToHomeScreen(BuildContext context) {
    context.navigateAndRemoveUntil(GamesScreen.route,
        predicate: (route) => false);
  }

  Widget buildLoadingGamesWidget(BuildContext context) {
    return SpinKitCircle(
      color: context.isDarkMode ? Colors.white : Colors.black,
      // color: Colors.red,
      size: 32.h,
    );
  }

  // Widget buildContent(BuildContext context,{String msg = ""}) {
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        buildLoginFormWidget(context),
        SizedBox(
          height: 16.h,
        ),
        buildLoginButtonSubmit(context),
      ],
    );
  }

  buildLoginFormWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Form(
        key: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h),
            buildClientIdFieldTitle(context),
            SizedBox(height: 24.h),
            buildClientSecretFieldTitle(context),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget buildClientIdFieldTitle(BuildContext context) {
    return DefaultTextField(
      controller: clientIdEditingController,
      textValidType: TextValidType.GENERAL,
      // client_id
      onSaved: (value) =>
          widget.cubit.state.loginForm["client_id"] = value.toString(),
      // initialValue: controller.user.value.email,
      onFieldSubmitted: (_) {
        // FocusScope.of(context).requestFocus(controller.phoneFocusNode);
      },
      hintText: context.l.enter_client_id,
      enabled: true,
      title: context.l.client_id,
      // isObscure: true,
      prefixIcon: Assets.icons.icMessageTitle
          .svg(height: 10.h, width: 10.w, color: const Color(0xffA6A6A6)),
      // suffixIcon: Icon(
      //   Icons.keyboard_arrow_down,
      //   color: Color(0xffA6A6A6),
      // ),
      textInputAction: TextInputAction.next,
      isRequired: true,
    );
  }

  Widget buildClientSecretFieldTitle(BuildContext context) {
    return DefaultTextField(
      controller: clientSecretEditingController,
      textValidType: TextValidType.GENERAL,
      onSaved: (value) =>
          widget.cubit.state.loginForm["client_secret"] = value.toString(),
      // initialValue: controller.user.value.email,
      onFieldSubmitted: (_) {
        // FocusScope.of(context).requestFocus(controller.phoneFocusNode);
      },
      hintText: context.l.enter_client_secret,
      enabled: true,
      title: context.l.client_secret,
      // isObscure: true,
      prefixIcon: Assets.icons.icMessageTitle
          .svg(height: 10.h, width: 10.w, color: const Color(0xffA6A6A6)),
      // suffixIcon: Icon(
      //   Icons.keyboard_arrow_down,
      //   color: Color(0xffA6A6A6),
      // ),
      textInputAction: TextInputAction.next,
      isRequired: true,
    );
  }

  Widget buildLoginButtonSubmit(BuildContext context) {
    return ButtonDefault(
      textColor: Colors.white,
      title: context.l.login,
    ).onClickBounce(() {
      _onAddButtonSubmit(context);
    });
  }

  void _onAddButtonSubmit(BuildContext context) {
    final form = this.form.currentState;
    if (form!.validate()) {
      form.save();
      BasicTools.hideKeyboard(context);
      widget.cubit.postGetToken();
    } else {}
  }
}
