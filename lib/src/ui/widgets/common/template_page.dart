// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:igameapp/src/configs/dimens.dart';
// import 'package:igameapp/src/controllers/app_controller.dart';

// // GetWidget<Controller> for create
// // GetView<Controller> for lazy
// class TemplateScreen extends GetWidget<> {
//   static const String route = "/TemplateScreen";
//
//   // final HomeController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Stack(
//         children: [
//           Scaffold(
//             // appBar: AppBarDefault(),
//             body: Stack(children: [
//               Container(
//                 margin: EdgeInsetsDirectional.only(
//                     start: Dimens.main_margin, end: Dimens.main_margin),
//                 child:const Center(
//                   child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "Templete page",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 48,
//                           ),
//                         ],
//                       )),
//                 ),
//               )
//             ],),
//             // bottomNavigationBar: buildUpdateButton(context),
//           ),
//         ],
//       ),
//     );
//   }
// }
