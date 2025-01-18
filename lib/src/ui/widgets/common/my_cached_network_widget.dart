import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/generated/assets.gen.dart';
import 'package:igameapp/src/configs/colors.dart';

class MyCachedNetworkImage extends StatelessWidget {

  final String? imUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const MyCachedNetworkImage({super.key,required this.imUrl,this.height,this.width,this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height??null,
      width: width??null,
      imageUrl: imUrl ??
          "",
      fit: fit?? BoxFit.cover,
      // errorWidget: (context, url, error) => Icon(
      //   Icons.error,
      //   color: AppColors.lightGray2,
      // ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey.withAlpha(75),
        child: Center(
          child: Image.asset(
        height: 50.h,
        width: 50.w,
        Assets.images.icAppLauncher.path,
        // color: AppColors.lightGray2,
      ),),),
      placeholder: (context, url) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
              valueColor:
              AlwaysStoppedAnimation<Color>(
                  Colors.black12),
            ),
          ),
        );
      },
    );
  }
}


