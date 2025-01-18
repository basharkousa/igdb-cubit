import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/api_state.dart';

class PaginationGridWidget<T, M> extends StatelessWidget {
  final List<M>? itemsList;
  final Function(M itemModel)? onClick;
  final Function()? onRetryClick;
  final ScrollController? scrollController;
  final IndexedWidgetBuilder? itemBuilder;
  final Rx<ApiState<T>>? paginationLiveData;
  final Widget? loadingWidget;

  const PaginationGridWidget(
      {Key? key,
      this.itemsList,
      this.onClick,
      this.scrollController,
      @required this.paginationLiveData,
      @required this.itemBuilder,
      this.loadingWidget,
      this.onRetryClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemsList!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 1.5 / 1.8,
            childAspectRatio: 1.8 / 3,
          ),
          itemBuilder: itemBuilder!,
        ),
        Obx(() {
          switch (paginationLiveData!.value.status) {
            case Status.LOADING:
              return loadingWidget ?? const Padding(
                padding: EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              );
            case Status.COMPLETED:
              return Container(
                height: 50,
              );
            case Status.ERROR:
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    onRetryClick!();
                  },
                  child: const Icon(
                    Icons.refresh,
                    size: 30,
                  ),
                ),
              );
          }
        })
      ],
    );
  }
}
