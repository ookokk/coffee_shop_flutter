// ignore_for_file: implementation_imports

import 'package:flutter/src/painting/text_style.dart';

class Drink {
  final String name;
  final String price;
  final String imagePath;

  Drink({
    required this.name,
    required this.price,
    required this.imagePath,
    required TextStyle style,
  });
}
