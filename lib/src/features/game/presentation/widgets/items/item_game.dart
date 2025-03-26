import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/core/widgets/common/extentions.dart';
import 'package:igameapp/src/core/widgets/common/my_cached_network_widget.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';

class ItemGame extends StatelessWidget {
  final Game game;
  final Function(Game) onClick;
  final Function(Game) onFavouriteCLick;

  const ItemGame(
      {super.key,
      required this.game,
      required this.onClick,
      required this.onFavouriteCLick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> onClick(game),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsetsDirectional.all(16.w),
        decoration: ShapeDecoration(
          // color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
            borderRadius: BorderRadius.circular(16.r),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x14366F7A),
              blurRadius: 24.r,
              offset: Offset(4, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: Container(
                  height: 100.h,
                  width: 100.h,
                  child: MyCachedNetworkImage(imUrl: game.coverBig)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    game.name ?? "",
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // color: Color(0xFF151515),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildFavouriteState()
                ],
              ),
            ),
            // Expanded(child: Container()),
            Icon(
              Icons.keyboard_arrow_right,
              size: 24.w,
              color: Color(0xffA6A6A6),
            )
          ],
        ),
      ),
    );
  }

  buildFavouriteState() {
    return IconButton(
        onPressed: () {
          onFavouriteCLick(game);
        },
        icon: Icon(game.isFavourite ? Icons.favorite : Icons.favorite_border));
  }
}

class ItemGameShimmer extends StatelessWidget {
  const ItemGameShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsetsDirectional.all(16.w),
      decoration: ShapeDecoration(
        // color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14366F7A),
            blurRadius: 24.r,
            offset: Offset(4, 8),
            spreadRadius: 0,
          )
        ],
      ),

      // height: 64.0.h,
      child: Row(
        children: [
          Column(
            children: <Widget>[
              // SizedBox(height: 10.w,),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: Container(
                    height: 100.h,
                    width: 100.h,
                    child: MyCachedNetworkImage(imUrl: "https:}")),
              ),
              SizedBox(
                width: 10.w,
              ),
              // Text(
              //   "projec",
              //   textAlign: TextAlign.start,
              //   style: TextStyle(
              //     backgroundColor: Colors.black,
              //     color: Color(0xFF151515),
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w600,
              //
              //   ),
              // ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          SizedBox(
            width: 10.h,
          ),
          Text(
            "projec",
            textAlign: TextAlign.start,
            style: TextStyle(
              backgroundColor: Colors.black,
              color: Color(0xFF151515),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_right,
            size: 24.w,
            color: Color(0xffA6A6A6),
          )
        ],
      ),
    );
  }
}
