import 'package:flutter/material.dart';

/// Wrapper for stateful functionality to provide onInit calls in stateles widget
class StatefulWrapper extends StatefulWidget {
  final Function? onInit;
  final Widget? child;
  const StatefulWrapper({super.key, @required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState(onInit!,child!);
}
class _StatefulWrapperState extends State<StatefulWrapper> {

   Function onInit;
   final Widget? child;

   _StatefulWrapperState(this.onInit,this.child);

  @override
  void initState() {
    print("init1");
    onInit();
    print("init2");
      super.initState();
    print("init1");

  }
  @override
  Widget build(BuildContext context) {
    return child!;
  }
}