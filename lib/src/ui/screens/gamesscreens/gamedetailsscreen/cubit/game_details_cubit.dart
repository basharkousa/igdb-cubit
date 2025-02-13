import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:igameapp/src/configs/navigation/route_setting.dart';
import 'package:igameapp/src/data/local/datasources/floor/entity/game_entity.dart';
import 'package:igameapp/src/data/models/gamesmodels/game_model.dart';
import 'package:igameapp/src/data/remote/exceptions/dio_error_util.dart';
import 'package:igameapp/src/data/repository.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'package:injectable/injectable.dart';

part 'game_details_state.dart';

class GameDetailsCubit extends Cubit<GameDetailsState> {
  final Repository repository;
  GameModel? gameModel;

  GameDetailsCubit(this.repository, this.gameModel)
      : super(GameDetailsInitial(gameModel));
}
