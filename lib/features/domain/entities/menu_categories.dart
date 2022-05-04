// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/generated/l10n.dart';

class MenuCategories extends Equatable {
  const MenuCategories({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  List<Object?> get props => [icon, text];
}

final List<MenuCategories> menuCategories = [
  MenuCategories(icon: LineIcons.map, text: S.current.nearMe),
  MenuCategories(icon: LineIcons.ribbon, text: S.current.bestSeller),
  MenuCategories(icon: LineIcons.piggyBank, text: S.current.budgetMeal),
  MenuCategories(icon: LineIcons.percent, text: S.current.discount),
  MenuCategories(icon: LineIcons.heartbeat, text: S.current.healthyFood),
];
