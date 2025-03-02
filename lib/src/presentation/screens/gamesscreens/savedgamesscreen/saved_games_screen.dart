import 'package:igameapp/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igameapp/src/configs/navigation/extension.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/presentation/screens/gamesscreens/gamedetailsscreen/game_details_screen.dart';
import 'package:igameapp/src/presentation/screens/gamesscreens/homescreen/cubit/home_cubit.dart';
import 'package:igameapp/src/presentation/widgets/appbars/app_bar_default.dart';
import 'package:igameapp/src/presentation/widgets/buttons/button_default.dart';
import 'package:igameapp/src/presentation/widgets/common/extentions.dart';
import 'package:igameapp/src/presentation/widgets/items/item_game.dart';
import 'package:igameapp/src/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class SavedGamesScreen extends StatelessWidget{
  static const String route = "/SavedGamesScreen";

  final HomeCubit homeCubit;


  SavedGamesScreen({super.key,required this.homeCubit});

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
                onRefresh: homeCubit.onRefresh,
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
                      /*  BlocProvider.value(
                          value: homeCubit,
                          child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              switch (state.runtimeType) {
                                case HomeInitial:
                                  return buildLoadingGamesWidget(context);
                                case HomeLoading:
                                  return buildLoadingGamesWidget(context);
                                case HomeSuccess:
                                  return buildGamesWidget(
                                      (state as HomeSuccess).localGames);
                                case HomeError:
                                  return buildErrorConnectionWidget();
                                default:
                                  return const Text('Unexpected state');
                              }
                            },
                          ),
                        ),*/
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


  Widget buildErrorConnectionWidget() {
    return (homeCubit.state as HomeError).localGames?.isNotEmpty??false // Check for local games state
        ? buildGamesWidget((homeCubit.state as HomeError).localGames??[])
        : Center(
      child: Text("No Cashed Games"),
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
              context.navigateTo(GameDetailsScreen.route,arguments: game);
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


  buildButtonClearHistory(BuildContext context) {
    return ButtonDefault(
      title: context.l.remove_games,
    ).onClickBounce((){
      homeCubit.clearGamesHistory();
    });
  }

  Widget buildLoadingGamesWidget(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.isDarkMode ? Colors.white12 : Colors.grey[300]!,
      highlightColor:
      context.isDarkMode ? Colors.white12.withOpacity(0.5) : Colors.grey[100]!,
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


}
