import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:igameapp/generated/assets.gen.dart';
import '../configs/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class BasicTools {
  BasicTools._();

  //https://stackoverflow.com/questions/41557139/how-do-i-bold-or-format-a-piece-of-text-within-a-paragraph
  static List<TextSpan> highlightOccurrences(String? source, String? query) {
    if (query == null ||
        query.isEmpty ||
        !source!.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }



  // static void showToastMessage(String? msg,
  //     {ToastGravity? gravity ,Toast? toastLength}
  //     ){
  //   Fluttertoast.showToast(
  //     msg: msg ?? "This is Toast sessage",
  //     toastLength:toastLength ?? Toast.LENGTH_LONG,
  //     gravity: gravity ?? ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }


  static void showToastMessage(String? msg, {ToastGravity? gravity}
      //     {SnackPosition? gravity}
      ) {
    // Get.snackbar(
    //     msg??'Message',
    //     '',
    //     snackPosition: gravity ?? SnackPosition.TOP,
    //     colorText: Colors.white,
    //     backgroundColor:  Colors.black.withOpacity(0.8)
    // );

    Fluttertoast.showToast(
      msg: msg ?? "This is Toast Message",
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.theme.colorScheme.secondary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showSnackBarMessage(String? msg,
      // {ToastGravity? gravity,Color? backgroundColor,}
          {SnackPosition? gravity,Function? onTap,bool? isDismissible,Duration? duration}
      ) {

    Get.snackbar("Alert!!", msg??"msg",
        icon: Assets.icons.icCheckboxInternet.svg(height: 21.h,width: 21.w,colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn)),
        snackPosition: gravity?? SnackPosition.TOP,
        duration: duration?? const Duration(seconds: 3),
        isDismissible: isDismissible ?? true,
        onTap: (e){
          //todo add callback to somewhere for bidders in Auctions detailsPage
          if(onTap != null){
            onTap();
          }
        },
        // backgroundGradient: LinearGradient(
        //   // colors: [AppColors.startGrediant, AppColors.endGrediant],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        backgroundColor: Colors.white,
        colorText: Colors.black,
        boxShadows: [BoxShadow(
          color: Color(0x14484D4D),
          blurRadius: 24.r,
          offset: Offset(4, 8),
          spreadRadius: 0,
        )],
        // colorText: AppColors.darkBlue,
        borderRadius: 8);

    // Get.snackbar(
    //     msg??'Message',
    //     '',
    //     snackPosition: gravity ?? SnackPosition.TOP,
    //     colorText: Colors.white,
    //     backgroundColor:  Colors.black.withOpacity(0.8)
    // );
  }

  static getCountryFlagIcon(var i) {
    print("getCountryFlagIcon: id: $i");
 /*   switch (i.toString()) {
      case "4":
        return SvgPicture.asset(
          Assets.ic_flag_lebanon,
          width: 38,
          height: 26,
        );
      case "2":
        return SvgPicture.asset(
          Assets.ic_flag_emirates,
          width: 38,
          height: 26,
        );
      case "3":
        return SvgPicture.asset(
          Assets.ic_flag_mexico,
          width: 38,
          height: 26,
        );
      default:
        return SvgPicture.asset(
          Assets.ic_flag_lebanon,
          width: 38,
          height: 26,
        );
    }*/
  }

  static openUrlLauncher(String url) async {
    var uri = Uri(scheme: 'https', host: "www.google.com");
    print('URL:$url');
    if (Platform.isIOS) {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      //const urll = url;
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static String getTimeStringFromDouble(double value) {
    if (value < 0) return '$value';
    int flooredValue = value.floor();
    double decimalValue = value - flooredValue;
    String hourValue = getHourString(flooredValue);
    String minuteString = getMinuteString(decimalValue);

    return '$hourValue:$minuteString';
  }

  static String getMinuteString(double decimalValue) {
    return '${(decimalValue * 60).toInt()}'.padLeft(2, '0');
  }

  static String getHourString(int flooredValue) {
    return '${flooredValue % 24}'.padLeft(2);
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType? cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input
        .startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.AmericanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.Discover;
    } else if (input
        .startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.DinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.Jcb;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else if (input == null) {
      cardType = CardType.Invalid;
    }
    return cardType!;
  }

  static RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String Function(Match) mathFunc = (Match match) => '${match[1]},';

  // for (String test in tests) {
  // String result = test.replaceAllMapped(reg, mathFunc);
  // print('$test -> $result');
  // }

  static String getNumberWithComma(String num) {
    return num.replaceAllMapped(reg, mathFunc);
  }

  static getDayNameByNum(int dayNum) {}

  static Future deleteImageFromCache(String Imgeurl) async {
    String url = Imgeurl;
    await CachedNetworkImage.evictFromCache(url);
  }
}

enum CardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}
