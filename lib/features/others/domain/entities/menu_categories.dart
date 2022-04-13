import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MenuCategories extends Equatable {
  final IconData icon;
  final String text;

  MenuCategories({
    required this.icon,
    required this.text,
  });

  @override
  List<Object?> get props => [icon, text];
}

final List<MenuCategories> menuCategories = [
  MenuCategories(icon: LineIcons.map, text: "Near me"),
  MenuCategories(icon: LineIcons.ribbon, text: "Best seller"),
  MenuCategories(icon: LineIcons.piggyBank, text: "Budget meal"),
  MenuCategories(icon: LineIcons.percent, text: "Discount"),
  MenuCategories(icon: LineIcons.heartbeat, text: "Healthy food"),
];
