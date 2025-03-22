import 'package:igameapp/src/core/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/core/configs/navigation/extension.dart';
import 'package:igameapp/src/core/presentation/screens/settingscreen/settings_screen.dart';
import 'package:igameapp/src/core/presentation/widgets/appbars/app_bar_home.dart';
import 'package:igameapp/src/core/presentation/widgets/common/paginationcubit/pagination_bloc_widget.dart';
import 'package:igameapp/src/core/presentation/widgets/items/item_game.dart';
import 'package:igameapp/src/core/utils/extensions.dart';
import 'package:igameapp/src/features/game/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/features/game/domain/models/cover.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/features/game/presentation/screens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/features/game/presentation/screens/savedgamesscreen/saved_games_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/HomeScreen";

  const HomeScreen({super.key, required this.homeCubit});

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarHome(
          title: context.l.popular_games_right_now ?? "",
          onSettingClick: () {
            print("Bdadba");
            context.navigateTo(SettingsScreen.route);
          },
          onHistoryClick: () {
            context.navigateTo(SavedGamesScreen.route);
          },
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
              start: Dimens.mainMargin, end: Dimens.mainMargin),
          child: RefreshIndicator(
            onRefresh: homeCubit.onRefresh,
            color: context.colorScheme.secondary,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: homeCubit.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 16.h,
                    ),
                    // Without Pagination
                    /*BlocStateWidget<BaseResponse<GameModel>, HomeCubit>(
                      cubit: homeCubit,
                      loadingWidget: buildLoadingGamesWidget(context),
                      contentWidget: (data) {
                        return buildGamesWidget(context, data?.list ?? []);
                      },
                      onRetryClicked: () {
                        homeCubit.getGames();
                      },
                    ),*/
                    // buildGameListWidgetState(context),
                    //pagination
                    PaginationBlocWidget<Game, HomeCubit>(
                      // Specify T and C
                      cubit: homeCubit,
                      // Pass your HomeCubit instance
                      contentWidget: (data) =>
                          buildGamesWidget(context, data ?? []),
                      // Your content widget
                      loadingWidget: buildLoadingGamesWidget(context),
                      loadingMoreWidget: buildLoadMoreLoading(context),
                      onRetryLoadMoreClicked: () {
                        homeCubit.loadMore();
                      },
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

  Widget buildGamesWidget(BuildContext context, List<Game>? list) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemGame(
              game: list?[index] ??
                  Game(
                      name: "UnDefined",
                      id: 0,
                      summary: "UnDefined",
                      screenshots: [],
                      isFavourite: false,
                      ratings: 0,
                      cover: null),
              onFavouriteCLick: (game) {
                homeCubit.toggleFavouriteState(game);
              },
              onClick: (game) {
                goToGameDetailsScreen(game, context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10.h,
            );
          },
          itemCount: list != null ? list.length : 0,
        ),
        // buildLoadMoreState(context)
      ],
    );
  }

/*
  Widget buildErrorConnectionWidget(BuildContext context, HomeState state) {
    return (state as HomeError)
            .localGames?.isNotEmpty??false // Check for local games state
        ? buildGamesWidget(context, state.localGames)
        : Center(
            child: Text("No Cashed Games"),
          );
  }
*/

  Widget buildLoadingGamesWidget(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.isDarkMode ? Colors.white12 : Colors.grey[300]!,
      highlightColor: context.isDarkMode
          ? Colors.white12.withOpacity(0.5)
          : Colors.grey[100]!,
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

  void goToGameDetailsScreen(Game game, BuildContext context) async {
    // context.navigateTo(GameDetailsScreen.route, arguments: game);

    // Get.toNamed(GameDetailsScreen.route, arguments: game);
  }

  buildGameListWidgetState(BuildContext context) {
    /*return BlocProvider.value(
      value: homeCubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state) {
            case HomeInitial():
              return buildLoadingGamesWidget(context);
            case HomeLoading():
              return buildLoadingGamesWidget(context);
            case HomeSuccess() || HomeLoadingMore() || HomeLoadMoreError():
              print("LostLensht ${homeCubit.gamesList.list?.length}");
              return buildGamesWidget(context,homeCubit.gamesList.list ?? []);
            case HomeError():
              return buildErrorConnectionWidget(context,state);
            default:
              return const Text('Unexpected state');
          }
        },
      ),
    );*/
  }

  /* buildLoadMoreState(BuildContext context) {
    switch (homeCubit.state) {
      case HomeLoadingMore():
        return buildLoadMoreLoading(context);
      case HomeLoadMoreError():
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              // homeCubit.loadMore();
            },
            child: const Icon(
              Icons.refresh,
              size: 30,
            ),
          ),
        );
      default:
        return Container(
          height: 0,
        );
    }
  }

 */

  buildLoadMoreLoading(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: context.isDarkMode ? Colors.white12 : Colors.grey[300]!,
        highlightColor: context.isDarkMode
            ? Colors.white12.withOpacity(0.5)
            : Colors.grey[100]!,
        child: ItemGameShimmer());
  }
}
