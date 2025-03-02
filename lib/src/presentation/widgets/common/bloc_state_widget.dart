import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igameapp/src/data/models/api_state.dart';
import 'package:igameapp/src/presentation/widgets/common/error_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'loading_widget.dart';

class BlocStateWidget<T, C extends BlocBase<ApiState<T>>> extends StatelessWidget {
  final Widget Function(T?)? contentWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final VoidCallback? onRetryClicked;
  final bool withShimmer;
  final C cubit; // Cubit creation function

  const BlocStateWidget({
    super.key,
    required this.cubit, // Cubit creation is now required
    this.contentWidget,
    this.loadingWidget,
    this.errorWidget,
    this.onRetryClicked,
    this.withShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>.value(
      value: cubit, // Use the provided creation function
      child: _BlocStateWidgetContent<T,C>( // Separate content widget
        contentWidget: contentWidget,
        loadingWidget: loadingWidget,
        errorWidget: errorWidget,
        onRetryClicked: onRetryClicked,
        withShimmer: withShimmer,
      ),
    );
  }
}

class _BlocStateWidgetContent<T, C extends BlocBase<ApiState<T>>> extends StatelessWidget { // Separate content widget
  final Widget Function(T?)? contentWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final VoidCallback? onRetryClicked;
  final bool withShimmer;

  const _BlocStateWidgetContent({
    super.key,
    this.contentWidget,
    this.loadingWidget,
    this.errorWidget,
    this.onRetryClicked,
    this.withShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, ApiState<T>>(
      builder: (context, state) {
        return state.when(
          loading: () => _buildLoading(context),
          completed: (data) => _buildContent(data, context),
          error: (message) => _buildError(message, context),
        );
      },
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
          onRetryPressed: onRetryClicked,
        );
  }

  Widget _buildContent(T? data, BuildContext context) {
    return contentWidget != null
        ? contentWidget!(data)
        : const Center(
      child: Text(""),
    );
  }
}