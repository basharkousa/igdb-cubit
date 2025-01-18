import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/ui/widgets/common/extentions.dart';
import 'package:igameapp/src/ui/widgets/common/my_cached_network_widget.dart';

class ItemGame extends StatelessWidget {

  final GameModel? game;
  final Function(GameModel) onClick;

  const ItemGame({super.key, required this.game,required this.onClick});

  @override
  Widget build(BuildContext context){
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
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            child: Container(
                height: 100.h,
                width: 100.h,
                child: MyCachedNetworkImage(imUrl: "https:${game?.cover?.url}")),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.h,),
                Text(
                  game?.name??"",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // color: Color(0xFF151515),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(children: [
                  IgnorePointer(
                    ignoring: true,
                    child: RatingBar.builder(
                      itemSize: 8.0,
                      initialRating: game?.rating??20 / 20,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                ],)

              ],
            ),
          ),
          // Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_right,size: 24.w,color: Color(0xffA6A6A6),)
        ],
      ),
    ).onClickBounce((){
      onClick(game!);
    });
  }
}

class ItemGameShimmer extends StatelessWidget {

  const ItemGameShimmer({super.key,});

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
              SizedBox(width: 10.w,),
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
              SizedBox(height: 10.h,),
            ],
          ),
          SizedBox(width: 10.h,),
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
          Icon(Icons.keyboard_arrow_right,size: 24.w,color: Color(0xffA6A6A6),)
        ],
      ),
    );
  }
}

