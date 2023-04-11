import 'package:bubble_tea/constants/text_style.dart';
import 'package:flutter/foundation.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  final List<Drink> _shop = [
    Drink(
      name: "Espresso",
      style: klargeText,
      price: "4.00",
      imagePath: "assets/images/espresso.png",
    ),
    Drink(
      name: "Iced Americano",
      style: klargeText,
      price: "4.00",
      imagePath: "assets/images/iced_americano.png",
    ),
    Drink(
      name: "Latte",
      style: klargeText,
      price: "6.00",
      imagePath: "assets/images/latte.png",
    ),
    Drink(
      name: "Milk Tea",
      style: klargeText,
      price: "6.00",
      imagePath: "assets/images/milk_tea.png",
    ),
    Drink(
      name: "Milkshake",
      style: klargeText,
      price: "6.00",
      imagePath: "assets/images/milkshake.png",
    ),
    Drink(
      name: "Turkish Coffee",
      style: klargeText,
      price: "15.00",
      imagePath: "assets/images/turkish_coffe.png",
    ),
  ];

  //list of drinks in user cart
  final List<Drink> _userCart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user cart
  List<Drink> get cart => _userCart;

  //add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
