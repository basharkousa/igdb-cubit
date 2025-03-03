import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'api_state_paging.dart';
import 'package:igameapp/src/data/remote/exceptions/dio_error_util.dart';
import 'package:dio/dio.dart';

abstract class BasePaginationCubit<T>
    extends Cubit<ApiStatePaging<BaseResponse<T>>> {
  final ScrollController scrollController = ScrollController();
  final int limit = 8;
  int offset = 0;

  BasePaginationCubit() : super(ApiLoading()) {
    scrollController.addListener(_scrollListener);
    getInitialList();
  }

  void _scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      loadMore();
    }
  }

  Future<void> getInitialList() async {
    emit(const ApiLoading());
    try {
      final response = await fetchInitialList();
      offset = response.list?.length ?? 0;
      emit(ApiCompleted(response));
    } on DioException catch (error) {
      emit(ApiError(DioErrorUtil.handleError(error) ?? "Error"));
    } catch (error) {
      emit(ApiError(error.toString()));
    }
  }

  Future<void> loadMore() async {
    print("loadMore");
    final currentState = state;
    if (currentState is ApiCompleted<BaseResponse<T>> ||
        currentState is ApiLoadMoreError<BaseResponse<T>>) {
      emit(ApiLoadingMore((currentState).data));

      try {
        final response = await fetchMoreList(offset);
        currentState.data?.list?.addAll(response.list ?? []);
        offset += response.list?.length ?? 0;

        emit(ApiCompleted(currentState.data));
      } on DioException catch (error) {
        emit(ApiLoadMoreError(
            DioErrorUtil.handleError(error) ?? "LoadMoreError",
            currentState.data));
      } catch (error) {
        emit(ApiLoadMoreError(error.toString(), currentState.data));
      }
    }
  }

  Future<BaseResponse<T>> fetchInitialList();

  Future<BaseResponse<T>> fetchMoreList(int offset);

  Future onRefresh() async {
    getInitialList();
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    return super.close();
  }
}
