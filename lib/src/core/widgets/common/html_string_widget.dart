
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HtmlStringWidget extends StatelessWidget {

  final String htmlContent;

  const HtmlStringWidget({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    print("htmlContent_:$htmlContent");
    return Scaffold(
      body: Container(
          child: Scrollbar(
              // isAlwaysShown: true,
              interactive: true,
              thickness: 2,
              radius: const Radius.circular(8),
              child: SingleChildScrollView(child:
              HtmlWidget(htmlContent)))),
        // child: SingleChildScrollView(child:
        // CustomPaint(
        //     size: Size(16, 200),
        //     painter: ScrollbarPainter(color: Colors.redAccent,thickness: 3,fadeoutOpacityAnimation:null),
        //     child: HtmlWidget(htmlContent)))),
    );
  }

}