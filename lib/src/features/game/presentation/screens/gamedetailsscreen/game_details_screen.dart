import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/core/configs/theme/colors.dart';
import 'package:igameapp/src/core/configs/dimens.dart';
import 'package:igameapp/src/core/configs/navigation/extension.dart';
import 'package:igameapp/src/core/widgets/appbars/app_bar_details.dart';
import 'package:igameapp/src/core/widgets/buttons/button_rounded.dart';
import 'package:igameapp/src/core/widgets/common/my_cached_network_widget.dart';
import 'package:igameapp/src/core/widgets/common/sliver_app_bar_delegate.dart';
import 'package:igameapp/src/core/utils/extensions.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/cubit/game_details_cubit.dart';
import 'package:readmore/readmore.dart';

class GameDetailsScreen extends StatelessWidget {
  static const String route = "/GameDetailsScreen";

  final GameDetailsCubit detailsCubit;

  const GameDetailsScreen({super.key, required this.detailsCubit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: buildBody(context),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      // controller: controller.scrollController,
      slivers: [
        SliverPersistentHeader(
          floating: false,
          pinned: true,
          delegate: SliverAppBarDelegate(
              minHeight: 220.0,
              maxHeight: 220.0,
              child: buildHeaderPage(context)),
        ),
        SliverList(
          delegate: SliverChildListDelegate(buildPageContent(context)),
        )
      ],
    );
  }

  buildHeaderPage(context) {
    return Container(
      color: Color(0xff02494B),
      height: 210.h,
      child: Stack(
        children: [
          MyCachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.cover,
              imUrl:
                  "https://images.igdb.com/igdb/image/upload/t_cover_big/${(detailsCubit.state as GameDetailsInitial).game?.cover?.imageId}.jpg"),
          Container(
            color: Colors.black.withAlpha(150),
          ),
          AppBarDetails(
            title: '',
            transparent: true,
          ),
          Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Container(
                    width: 85.85.w,
                    height: 90.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.circular(58.r),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(58.r),
                      child: MyCachedNetworkImage(
                        width: 59.20.w,
                        height: 62.06.h,
                        imUrl:
                            "https:${(detailsCubit.state as GameDetailsInitial).game?.cover?.url}",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimens.mainMargin),
                    child: Text(
                      (detailsCubit.state as GameDetailsInitial).game?.name ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  List<Widget> buildPageContent(BuildContext context) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              RatingBar.builder(
                itemSize: 18.0,
                initialRating: (detailsCubit.state as GameDetailsInitial).game?.rating??20 / 20,
                minRating: 1,
                ignoreGestures: true,
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
              SizedBox(
                width: 3.0,
              ),
            ],),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.mainMargin),
            child: Text(
              context.l.summary,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.mainMargin),
            child: ReadMoreText(
                (detailsCubit.state as GameDetailsInitial).game?.summary ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                trimLength: 125,
                trimCollapsedText: "show more",
                trimExpandedText: " show less",
                moreStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightAccent),
                lessStyle:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 16.h,
          ),
          buildStorePhotosWidget(),
          SizedBox(
            height: 100.h,
          )
        ],
      )
    ];
  }

  buildStorePhotosWidget() {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: Dimens.mainMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          buildProductsWidget()
        ],
      ),
    );
  }

  buildProductsWidget() {
    return (detailsCubit.state as GameDetailsInitial)
                .game
                ?.screenshots
                ?.isNotEmpty ??
            false
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (detailsCubit.state as GameDetailsInitial)
                    .game
                    ?.screenshots
                    ?.length ??
                0,
            padding: EdgeInsetsDirectional.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 166 / 110,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showPhotoViewDialog(
                      "https://images.igdb.com/igdb/image/upload/t_screenshot_big/${(detailsCubit.state as GameDetailsInitial).game?.screenshots?[index].imageId}.jpg",context);
                },
                child: Container(
                  // width: 166.w,
                  height: 110.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: Color(0xFFE7E7E7)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  // child: MyCachedNetworkImage(imUrl: controller.store.products![index].sImage,),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: MyCachedNetworkImage(
                        // imUrl: controller.game?.screenshots![index].url,
                        imUrl:
                            "https://images.igdb.com/igdb/image/upload/t_screenshot_big/${(detailsCubit.state as GameDetailsInitial).game?.screenshots?[index].imageId}.jpg",
                      )),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text("No Screenshots"),
            ),
          );
  }

  void showPhotoViewDialog(String? sImage,BuildContext context) {
    showDialog(context: context, builder: (context){
      return Container(
        margin: EdgeInsetsDirectional.all(8.h),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: ButtonRounded()),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                // padding: EdgeInsetsDirectional.all(Dimens.main_margin),
                child: Center(
                  // child: Image.asset(Assets.images.imProductFullImage.path),
                  // child: MyCachedNetworkImage(imUrl: "https://compote.slate.com/images/22ce4663-4205-4345-8489-bc914da1f272.jpeg?crop=1560%2C1040%2Cx0%2Cy0&width=960",),
                  child: Container(
                    height: double.infinity,
                    child: MyCachedNetworkImage(
                      imUrl: sImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
