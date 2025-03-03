import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/data/models/BaseResponse.dart';
import 'api_state_paging.dart';
import 'package:igameapp/src/presentation/widgets/common/paginationcubit/base_pagination_cubit.dart';
import 'package:igameapp/src/presentation/widgets/common/error_widget.dart';
import 'package:igameapp/src/presentation/widgets/common/loading_widget.dart';
import 'package:shimmer/shimmer.dart';

class PaginationBlocWidget<T, C extends BasePaginationCubit<T>>
    extends StatelessWidget {
  final Widget Function(BaseResponse<T>?)? contentWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? loadingMoreWidget; // Add loadingMoreWidget
  final Widget? loadMoreErrorWidget; // Add loadMoreErrorWidget
  final VoidCallback? onRetryClicked;
  final VoidCallback? onRetryLoadMoreClicked;
  final bool withShimmer;
  final C cubit;

  const PaginationBlocWidget({
    super.key,
    required this.cubit,
    this.contentWidget,
    this.loadingWidget,
    this.errorWidget,
    this.loadingMoreWidget,
    this.loadMoreErrorWidget,
    this.onRetryClicked,
    this.onRetryLoadMoreClicked,
    this.withShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>.value(
      value: cubit,
      child: BlocBuilder<C, ApiStatePaging<BaseResponse<T>>>(
        builder: (context, state) {
          return state.when(
            loading: () => _buildLoading(context),
            completed: (data) => _buildContent(data: data, context: context),
            error: (message) => _buildError(message, context),
            loadingMore: (data) => Column(
              children: [
                _buildContent(data: data, context: context),
                _buildLoadingMore(data, context)
              ],
            ),
            loadMoreError: (message,data) => Column(
              children: [
                _buildContent(data: data,context: context),
                _buildLoadMoreError(message, context)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return withShimmer
        ? Shimmer.fromColors(
            baseColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white12
                : Colors.grey[300]!,
            highlightColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white12.withOpacity(0.5)
                : Colors.grey[100]!,
            child: loadingWidget ?? const LoadingWidget(),
          )
        : loadingWidget ?? const LoadingWidget();
  }

  Widget _buildError(String message, BuildContext context) {
    return errorWidget ??
        ErrorsWidget(
          errorMessage: message,
          onRetryPressed: () {
            (onRetryClicked ?? () => cubit.getInitialList())();
          },
        );
  }

  Widget _buildContent({BaseResponse<T>? data, BuildContext? context}) {
    return contentWidget != null
        ? contentWidget!(data)
        : const Center(
            child: Text(""),
          );
  }

  Widget _buildLoadingMore(BaseResponse<T>? data, BuildContext context) {
    return loadingMoreWidget ??
        const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadMoreError(String message, BuildContext context) {
    return loadMoreErrorWidget ??
        ErrorsWidget(
          errorMessage: message,
          // onRetryPressed: () =>
          //     (onRetryLoadMoreClicked ?? () => cubit.loadMore())(), // Retry loadMore
          onRetryPressed: (){

            (onRetryLoadMoreClicked ?? () {cubit.loadMore();})();
          },
        );
  }
}
