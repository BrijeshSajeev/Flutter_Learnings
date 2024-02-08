import 'package:flutter/material.dart';

enum Categories {
  other,
  dairy,
  fruit,
  meat,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  vegetables
}

class Category {
  const Category(this.title, this.color);
  final String title;
  final Color color;
}
