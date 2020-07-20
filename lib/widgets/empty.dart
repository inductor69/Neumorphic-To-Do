import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyTodo extends StatelessWidget {
  const EmptyTodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 200,
          height: 200,
          child: Lottie.network(
            'https://assets6.lottiefiles.com/packages/lf20_fxvz0c.json',
            alignment: Alignment.center,
            fit: BoxFit.fill,
          )),
    );
  }
}
