import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/api_state.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_widget.dart';

import 'package:shimmer/shimmer.dart';

class GetXStateWidget<T> extends StatelessWidget {
  final Rx<ApiState<T>> snapshotLiveData;
  final Widget Function(T?)? contentWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Function? onRetryClicked;
  bool withShimmer;

  // final bool isList;

  GetXStateWidget(
      {required this.snapshotLiveData,
      this.contentWidget,
      this.errorWidget,
      this.loadingWidget,
      this.onRetryClicked,
      this.withShimmer = false});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!snapshotLiveData.value.isNull) {
        switch (snapshotLiveData.value.status) {
          case Status.LOADING:
            return buildLoading();
          case Status.COMPLETED:
            // if(isList)
            // if (snapshotLiveData.value.data.isEmpty)
            //   return Center(
            //     child: Container(
            //       margin: EdgeInsets.all(30),
            //       child: Text(Strings.noResult.tr),
            //     ),
            //   );
            return buildContent(snapshotLiveData.value.data);
          // return buildLoading();
          case Status.ERROR:
            return buildError();
        }
      }
      return buildLoading() ?? LoadingWidget();
    });
  }

  // buildContent() {

  // }

  buildLoading() {
    return withShimmer
        ? Shimmer.fromColors(
            baseColor: Get.isDarkMode ? Colors.white12 : Colors.grey[300]!,
            highlightColor: Get.isDarkMode
                ? Colors.white12.withOpacity(0.5)
                : Colors.grey[100]!,
            child: Container(
              child: loadingWidget ?? LoadingWidget(),
            ),
          )
        : Container(
            child: loadingWidget ?? LoadingWidget(),
          );
  }

  Widget buildError() {
    return errorWidget ??
        ErrorsWidget(
          errorMessage: '',
          onRetryPressed: () => {if (onRetryClicked != null) onRetryClicked!()},
        );
  }

  Widget buildContent(T? data) {
    return contentWidget != null
        ? contentWidget!(data)
        : Container(
            // margin: EdgeInsetsDirectional.only(top: 4.0, start: 7, end: 7),
            child: const Center(
              child: Text(""),
            ),
          );
  }
}
