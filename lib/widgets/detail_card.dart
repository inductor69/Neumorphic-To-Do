import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/todo_models.dart';
import '../style.dart';

class HeroProgress extends StatelessWidget {
  const HeroProgress({
    Key key,
    @required this.category,
  }) : super(key: key);

  final TodoCategory category;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'progress_${category.id}',
      flightShuttleBuilder: flightShuttleBuilderFix,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              'task_card',
              style: TextStyle(
                  color: NeumorphicTheme.defaultTextColor(context)
                      .withOpacity(0.5),
                  fontSize: 26.00),
            ).plural(category.totalItems),
          ),
          const SizedBox(
            height: Style.halfPadding,
          ),
        ],
      ),
    );
  }
}

class HeroTitle extends StatelessWidget {
  const HeroTitle({
    Key key,
    @required this.category,
  }) : super(key: key);

  final TodoCategory category;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'title_${category.id}',
      flightShuttleBuilder: flightShuttleBuilderFix,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          category.title,
          style: TextStyle(
              color: NeumorphicTheme.defaultTextColor(context),
              fontSize: 40.00),
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class HeroIcon extends StatelessWidget {
  const HeroIcon({
    Key key,
    @required this.category,
  }) : super(key: key);

  final TodoCategory category;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'icon_${category.id}',
      child: Neumorphic(
        padding: const EdgeInsets.all(16),
        style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
        child: Align(
          alignment: Alignment.center,
          child: FaIcon(
            category.icon,
            color: Style.primaryColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}

Widget flightShuttleBuilderFix(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  ///fix overflow flex
  return SingleChildScrollView(
    //fix missed style
    child: DefaultTextStyle(
        style: DefaultTextStyle.of(fromHeroContext).style,
        child: fromHeroContext.widget),
  );
}
