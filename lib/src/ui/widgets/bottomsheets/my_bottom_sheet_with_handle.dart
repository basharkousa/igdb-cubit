import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomSheetWithHandle extends StatelessWidget {
  final Widget child;

  const MyBottomSheetWithHandle({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:const BorderRadiusDirectional.only(topStart:  Radius.circular(16.0),topEnd:Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          // The handle
          Container(
            margin: const EdgeInsetsDirectional.all(8.0),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(height: 10),

          // The child of the bottom sheet
          child,
        ],
      ),
    );
  }
}