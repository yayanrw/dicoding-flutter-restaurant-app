// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
  const MenuCategories(icon: LineIcons.map, text: 'Near me'),
  const MenuCategories(icon: LineIcons.ribbon, text: 'Best seller'),
  const MenuCategories(icon: LineIcons.piggyBank, text: 'Budget meal'),
  const MenuCategories(icon: LineIcons.percent, text: 'Discount'),
  const MenuCategories(icon: LineIcons.heartbeat, text: 'Healthy food'),
];
