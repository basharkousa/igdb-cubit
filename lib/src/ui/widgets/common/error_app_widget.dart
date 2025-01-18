import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../generated/locales.g.dart';
import '../../../configs/dimens.dart';

class ErrorAppWidget extends StatelessWidget {
  final String? errorMessage;

  final Function()? onRetryPressed;

  const ErrorAppWidget({Key? key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(Assets.icons.icNoConnection.path),
               SizedBox(
                height: 50.h,
              ),
              Text(
                LocaleKeys.no_internet.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xff333333),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.Looks_like_you_have_lost_connection.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                LocaleKeys.try_these_steps.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff9c9c9c),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.icons.icCheckboxInternet.path),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      LocaleKeys.check_your_modem_and_router.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff9c9c9c),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.icons.icCheckboxInternet.path),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                     LocaleKeys.reconnect_to_Wi_Fi.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff9c9c9c),
                      ),
                    )
                  ],
                ),
              ),
              // ElevatedButton(
              //   color: Colors.black87,
              //   child: Text('Retry', style: TextStyle(color: Colors.white)),
              //   onPressed: onRetryPressed,
              // )
            ],
          ),
        ),
        bottomNavigationBar: buildReloadButton(context),
      ),
    );
  }

  Widget buildReloadButton(BuildContext context) {
    return Container(
      height: 42.00.h,
      margin: EdgeInsetsDirectional.only(
          start: Dimens.mainMargin,
          end: Dimens.mainMargin,
          bottom: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0))),
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.black
          ),
          foregroundColor:
          MaterialStateProperty.all<Color>(Colors.black
          ),
          overlayColor: MaterialStateProperty.all<Color>(Colors.white24.withOpacity(0.5)
          ),
        ),
        onPressed: onRetryPressed,
        child: Text(
          LocaleKeys.reload.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: const Color(0xffffffff).withOpacity(0.87),
          ),
        ),
      ),
    );
  }
}
