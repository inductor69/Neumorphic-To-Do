import 'package:flutter/widgets.dart';

class Glow extends StatelessWidget {
  final Widget child;
  final Color color;
  final double intensity;
  final double radius;
  final double spread;

  const Glow({
    Key key,
    @required this.child,
    @required this.color,
    this.intensity = 0.5,
    this.radius = 5.0,
    this.spread = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: intensity,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color,
                  blurRadius: radius,
                  spreadRadius: spread,
                )
              ],
            ),
            child: child,
          ),
        ),
        child
      ],
    );
  }
}
