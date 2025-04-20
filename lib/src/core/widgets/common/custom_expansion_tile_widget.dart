import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../generated/assets.gen.dart';
import '../../configs/dimens.dart';

class CustomExpansionTile extends StatelessWidget {
  final String? title;
  final Widget? body;
  bool? isExpanded;
  final Widget? openExpandIcon;
  final Widget? closeExpandIcon;
  final Function(bool value)? onIsExpanded;

  CustomExpansionTile(
      {super.key, this.title,
      this.body,
      this.isExpanded,
      this.openExpandIcon,
      this.closeExpandIcon,
      this.onIsExpanded}) {
    print('isExpanded $isExpanded');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    // return Obx(() {
      return Container(
        margin: const EdgeInsetsDirectional.only(start: 0, top: 8.0),
        child: Theme(
          data: theme,
          child: ExpansionTile(
            title: Text(
              title??'',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xde000000),
                fontWeight: FontWeight.w500,
                height: 1.4285714285714286,
              ),
              textAlign: TextAlign.start,
            ),
            trailing: isExpanded??false
                ? closeExpandIcon ??
                SvgPicture.asset(
                  Assets.icons.icCloseExpantion.path,
                  width: 14.w,
                )
                : openExpandIcon ??
                SvgPicture.asset(
                  Assets.icons.icOpenExpantion.path,
                  width: 14.w,
                ),
            onExpansionChanged: (bool expanding) {
              print("onExpansionChanged $expanding");
              isExpanded = expanding;
              print("isExpanded.value ${isExpanded}");
              if (onIsExpanded != null) onIsExpanded!(expanding);
            },
            initiallyExpanded: isExpanded??false,
            //trailing:Icon(Icons.arrow_downward),
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: Dimens.mainMargin,
                    bottom: 8.0.h,
                    end: Dimens.mainMargin),
                child: body,
              )
            ],
          ),
        ),
      );
    // });
  }
}
