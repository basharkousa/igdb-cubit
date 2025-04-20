import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/core/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/core/configs/navigation/extension.dart';
import 'package:igameapp/src/core/widgets/appbars/app_bar_default.dart';
import 'package:igameapp/src/core/widgets/buttons/button_default.dart';
import 'package:igameapp/src/core/widgets/common/extentions.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamesscreen/cubit/games_cubit.dart';
import 'package:igameapp/src/features/game/presentation/screens/savedgamesscreen/cubit/saved_games_cubit.dart';
import 'package:igameapp/src/features/game/presentation/widgets/items/item_game.dart';
import 'package:igameapp/src/core/utils/extensions.dart';
import 'package:igameapp/src/features/game/domain/models/game.dart';
import 'package:igameapp/src/features/game/presentation/screens/gamedetailsscreen/game_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class SavedGamesScreen extends StatelessWidget {
  static const String route = "/SavedGamesScreen";

  final SavedGamesCubit cubit;

  const SavedGamesScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: context.l.saved_games,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      start: Dimens.mainMargin, end: Dimens.mainMargin),
                  child: RefreshIndicator(
                    onRefresh: cubit.onRefresh,
                    color: context.colorScheme.secondary,
                    child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 16.h,
                            ),
                            BlocProvider.value(
                              value: cubit,
                              child: BlocBuilder<
                                  SavedGamesCubit,
                                  SavedGamesState>(
                                builder: (context, state) {
                                  return state.when(
                                      gamesLoaded: (games){
                                        print("Screen${games.length} ${games.isEmpty}");
                                        return buildGamesWidget(games);
                                      },
                                      gameError:(message) => buildGameErrorWidget(message),
                                      gamesEmpty: (){
                                        print("Screen");
                                        return buildGameErrorWidget("Empty Game List");
                                      });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 48.h,
                            ),
                          ],
                        )),
                  ),
                )),
          ],
        ),
        bottomNavigationBar: buildButtonClearHistory(context),
      ),
    );
  }

  /* Widget buildErrorConnectionWidget() {
    return (homeCubit.state as HomeError).localGames?.isNotEmpty??false // Check for local games state
        ? buildGamesWidget((homeCubit.state as HomeError).localGames??[])
        : Center(
      child: Text("No Cashed Games"),
    );
  }*/

  Widget buildGamesWidget(List<Game> list) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemGame(
            onFavouriteCLick: (game) {
              cubit.toggleFavouriteState(game);
            },
            game: list[index],
            onClick: (game) {
              context.navigateTo(GameDetailsScreen.route, arguments: game);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.h,
          );
        },
        itemCount: list.length);
  }

  buildButtonClearHistory(BuildContext context) {
    return ButtonDefault(
      title: context.l.clean_cash,
    ).onClickBounce(() {
      // cubit.clearGamesHistory();
    });
  }

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

  Widget buildGameErrorWidget(String message) {
    return Center(child: Text(message),);
  }
}
