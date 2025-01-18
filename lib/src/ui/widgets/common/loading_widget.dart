import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/generated/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingMessage;
  final double? height;
  final double? width;

  const LoadingWidget({Key? key, this.loadingMessage,this.width,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          loadingMessage != null
              ? Text(
            loadingMessage ?? " Loading ..",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          )
              : Container(),
          loadingMessage != null
              ? const SizedBox(height: 24) : Container(),
          Image.asset(
            Assets.images.gif.icLoading.path,
            height: height?? 32.h,
            width: height?? 32.w,
          ),
        ],
      ),
    );
  }
}
