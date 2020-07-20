import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:todolist/pages/me.dart';

import '../style.dart';
import '../widgets/carousel.dart';
import '../widgets/timer.dart';
import 'me.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: Mine(),
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: Style.doublePadding),
              child: MainTimer(),
            ),
            const Carousel(),
            const SizedBox(height: Style.doublePadding)
          ],
        ),
      ),
    );
  }
}
