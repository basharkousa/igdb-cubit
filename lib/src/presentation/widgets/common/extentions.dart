import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

extension OnPressed on Widget {
  //ripple
  Widget onClick(Function onPressed,
      {BorderRadiusGeometry borderRadius =
      const BorderRadius.all(Radius.circular(5)),bool noRipple = false}) =>
      Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius:
                          borderRadius ?? BorderRadius.circular(4.0))),
                  // backgroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.black),
                  // foregroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.black),
                  overlayColor: noRipple ? null: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.5)),
                ),
                onPressed: () {
                  onPressed();
                },
                child: Container()),
          )
        ],
      );


  Widget onClickBounce(Function onPressed) => SpringButton(
      SpringButtonType.OnlyScale,
      Stack(
        children: <Widget>[
          this,
        ],
      ),
      // scaleCoefficient: 0.90,
      scaleCoefficient: 0.94,
      onTapDown: (m) {}, onTap: () {
    onPressed();
  });
}
// Add this line at end of any widget to handle click and show ripple effect.
//.
