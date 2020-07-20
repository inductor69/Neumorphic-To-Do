import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, IconData> icons_list = {
  'shopping-cart': FontAwesomeIcons.shoppingCart,
  'calendar-check': FontAwesomeIcons.calendarCheck,
  'tools': FontAwesomeIcons.tools,
  'money-bill-alt': FontAwesomeIcons.moneyBillAlt,
  'star': FontAwesomeIcons.star,
};

extension IconDataSearchExtension on IconData {
  //search key from icons_list
  String get getFontAwesomeString =>
      icons_list.entries.firstWhere((element) => element.value == this).key;
}

extension IconDataConverterExtension on String {
  IconData get getFontAwesomeIcon {
    final icon = icons_list[this];
    if (icon == null) {
      return FontAwesomeIcons.questionCircle;
    } else {
      return icon;
    }
  }
}
