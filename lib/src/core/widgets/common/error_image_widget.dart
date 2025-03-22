import 'package:flutter/material.dart';

class ErrorImageWidget extends StatelessWidget {
  // final String errorMessage;
  //
  // final Function onRetryPressed;

  const ErrorImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.4,
        child: Container(
        //     child: Image.asset(
        //   Assets.ic_default_thumb_jpg,
        //   fit: BoxFit.cover,
        // )
          child: const Icon(Icons.question_mark)
        ));
  }
}
