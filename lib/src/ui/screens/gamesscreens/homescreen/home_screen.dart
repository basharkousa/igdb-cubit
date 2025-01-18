import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:igameapp/generated/locales.g.dart';
import 'package:igameapp/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/ui/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/ui/widgets/appbars/app_bar_home.dart';
import 'package:igameapp/src/ui/widgets/items/item_game.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/HomeScreen";

  HomeScreen({super.key});

  final HomeCubit homeCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarHome(
          title: LocaleKeys.popular_games_right_now.tr,
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
              start: Dimens.mainMargin, end: Dimens.mainMargin),
          child: RefreshIndicator(
            onRefresh: homeCubit.onRefresh,
            color: Get.theme.colorScheme.secondary,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                // controller: homeCubit.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 16.h,
                    ),
                    // Without Pagination
                    BlocProvider(
                      create: (context) => homeCubit,
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          switch (state.runtimeType) {
                            case HomeInitial:
                              return buildLoadingGamesWidget();
                            case HomeLoading:
                              return buildLoadingGamesWidget();
                            case HomeSuccess:
                              return buildGamesWidget(
                                  (state as HomeSuccess).response.list ?? []);
                            case HomeError:
                              return buildErrorConnectionWidget();
                            default:
                              return const Text('Unexpected state');
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                  ],
                )),
          ),
        ),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  Widget buildGamesWidget(List<GameModel> list) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemGame(
            game: list[index],
            onClick: (game) {
              goToGameDetailsScreen(game);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.h,
          );
        },
        itemCount: list.length ?? 0);
  }

  Widget buildErrorConnectionWidget() {
    return (homeCubit.state as HomeError).localGames.length>0 // Check for local games state
        ? buildGamesWidget((homeCubit.state as HomeError).localGames)
        : Center(
            child: Text("No Cashed Games"),
          );
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

  void goToGameDetailsScreen(GameModel game) {
     Get.toNamed(GameDetailsScreen.route,arguments: game);
  }
}
