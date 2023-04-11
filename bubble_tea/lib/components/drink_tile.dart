// ignore_for_file: must_be_immutable

import 'package:bubble_tea/constants/text_style.dart';
import 'package:flutter/material.dart';
import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  final Widget trailing;
  DrinkTile(
      {super.key,
      required this.trailing,
      required this.drink,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.brown[100], borderRadius: BorderRadius.circular(50)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          title: (Text(drink.name, style: kmediumText)),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath, width: 100, height: 100),
          trailing: trailing,
        ),
      ),
    );
  }
}
