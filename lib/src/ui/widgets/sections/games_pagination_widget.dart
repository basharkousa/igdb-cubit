//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/configs/dimens.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:igameapp/src/data/models/api_state.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/ui/widgets/common/error_widget.dart';
import 'package:igameapp/src/ui/widgets/common/pagination/pagination_list_widget.dart';
import 'package:igameapp/src/ui/widgets/items/item_game.dart';
import 'package:shimmer/shimmer.dart';

class GamesPaginationWidget extends StatelessWidget {
  final Rx<ApiState<BaseResponse<GameModel>>>? snapshot;
  final Rx<ApiState<BaseResponse<GameModel>>>? paginationLiveData;
  final Function()? onRetryPressed;
  final Function()? onPaginationRetryClick;
  Function(GameModel) onReturnGame;


  GamesPaginationWidget(
      {required this.snapshot,
        required this.onRetryPressed,
        required this.paginationLiveData,
        required this.onPaginationRetryClick,
        required this.onReturnGame,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!snapshot!.value.isNull) {
        switch (snapshot!.value.status) {
          case Status.LOADING:
            return const LoadingShimmerWidget(itemCounts: 4,);
          case Status.COMPLETED:
            if (snapshot!.value.data!.list!.isEmpty) {
              return buildNoAuctionsFound();
            }
            return buildContentPagination(snapshot!.value.data!.list!);

          case Status.ERROR:
            return ErrorsWidget(
              onRetryPressed: () => {onRetryPressed!()},
            );

        }
      }
      return const LoadingShimmerWidget(itemCounts: 4,);
    });
  }

  void moveToProductDetailsPage(GameModel gameModel) {
    Get.toNamed(GameDetailsScreen.route, arguments: gameModel);
  }

  buildContentSection(List<GameModel> games) {
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.h,
          ),
          Container(
            // height: 430.h,
            margin: EdgeInsetsDirectional.symmetric(horizontal: Dimens.mainMargin),
            child: ListView.separated(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: games.length ,
              itemBuilder: (context, index) {
                return ItemGame(
                  game: games[index],
                  onClick: (game) {
                    onReturnGame(game);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 12.w,
                );
              },
            ),

          )
          // SizedBox(height: 23.h,),
        ],
      ),
    );
  }

  buildContentPagination(List<GameModel> games) {
    return PaginationListWidget(
        itemsList: games,
        paginationLiveData: paginationLiveData,
        loadingWidget: const LoadingShimmerWidget(itemCounts: 1,),
        onRetryClick: (){
          onPaginationRetryClick!();
        },
        itemBuilder: (context, index) {
          return ItemGame(
            game: games[index],
            onClick: (game) {
              onReturnGame(game);
            },
          );
        });
  }

  buildNoAuctionsFound() {
    return Container(
      width: Get.width,
      height: 343.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.80.w, color: Color(0x99E6E6E6)),
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
      child: Column(
        children: [
          SizedBox(
            height: 34.h,
          ),

          SizedBox(
            height: 5.h,
          ),
          Text(
            'Error',
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: Color(0xFF151515),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
  SizedBox(
            height: 23.h,
          ),
          // SizedBox(height: 23.h,),
        ],
      ),
    );
  }

}

class LoadingShimmerWidget extends StatelessWidget{


  final String? loadingMessage;
  final int? itemCounts;

  const LoadingShimmerWidget({Key? key, this.loadingMessage,this.itemCounts,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode ? Colors.white12 : Colors.grey[300]!,
      highlightColor:
      Get.isDarkMode ? Colors.white12.withOpacity(0.5) : Colors.grey[100]!,
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemGameShimmer();
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10.h,
            );
          },
          itemCount: itemCounts??4),
    );
  }

}

Widget buildLoadingGamesWidget() {
  return Shimmer.fromColors(
    baseColor: Get.isDarkMode ? Colors.white12 : Colors.grey[300]!,
    highlightColor:
    Get.isDarkMode ? Colors.white12.withOpacity(0.5) : Colors.grey[100]!,
    child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemGameShimmer();
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.h,
          );
        },
        itemCount: 4),
  );
}



