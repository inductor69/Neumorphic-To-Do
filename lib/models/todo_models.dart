import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/icons.dart';

abstract class TodoModel {
  final int id;

  const TodoModel({this.id});

  factory TodoModel.fromMap() {
    return null;
  }
  Map<String, dynamic> toMap() {
    return null;
  }
}

class TodoCategory extends TodoModel {
  @override
  final int id;
  final String title;
  final IconData icon;
  final int completed;
  final int totalItems;

  static const String table = 'Categories';

  const TodoCategory(
      {this.id,
      this.title = '',
      this.icon,
      this.completed = 0,
      this.totalItems = 0});

  factory TodoCategory.fromMap(Map<String, dynamic> map) => TodoCategory(
        id: map['id'] as int,
        title: map['title'] as String,
        icon: map['icon'].toString().getFontAwesomeIcon,
        completed: map['completed'] as int,
        totalItems: map['totalItems'] as int,
      );

  double get percent {
    if (totalItems == 0) {
      return 0.0;
    } else {
      return (completed / totalItems).toDouble();
    }
  }

  String get percentString => NumberFormat.percentPattern().format(percent);

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'icon': icon.getFontAwesomeString,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  //override bool operator ==

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TodoCategory &&
        o.id == id &&
        o.title == title &&
        o.icon == icon &&
        o.completed == completed &&
        o.totalItems == totalItems;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        icon.hashCode ^
        completed.hashCode ^
        totalItems.hashCode;
  }

  @override
  String toString() {
    return 'TodoCategory(id: $id, title: $title, icon: $icon, completed: $completed, totalItems: $totalItems)';
  }

  TodoCategory copyWith({
    int id,
    String title,
    IconData icon,
    int completed,
    int totalItems,
  }) {
    return TodoCategory(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      completed: completed ?? this.completed,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

class TodoItem extends TodoModel {
  @override
  final int id;
  final int category;
  final String title;
  final String description;
  final bool completed;

  static const String table = 'Items';

  const TodoItem(
      {this.id,
      this.category,
      this.title = '',
      this.description = '',
      this.completed = false});

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'category': category,
      'title': title,
      'description': description,
      'completed': completed ? '1' : '0'
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) => TodoItem(
      id: map['id'] as int,
      category: map['category'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      completed: map['completed'] == 1);

  @override
  String toString() {
    return 'TodoItem(id: $id, category: $category, title: $title, description: $description, completed: $completed)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TodoItem &&
        o.id == id &&
        o.category == category &&
        o.title == title &&
        o.description == description &&
        o.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        title.hashCode ^
        description.hashCode ^
        completed.hashCode;
  }

  TodoItem copyWith({
    int id,
    int category,
    String title,
    String description,
    bool completed,
  }) {
    return TodoItem(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
