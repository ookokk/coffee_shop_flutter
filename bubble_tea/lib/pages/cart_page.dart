import 'package:bubble_tea/components/drink_tile.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: (context, value, child) => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text('Cart'),
                  const SizedBox(height: 10),
                  //list of cart items
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        //get individual drink in cart first
                        Drink drink = value.cart[index];
                        //return as a nice tile
                        return DrinkTile(
                            trailing: const Icon(Icons.delete),
                            drink: drink,
                            onTap: () => removeFromCart(drink));
                      },
                    ),
                  ),
                  const MaterialButton(
                      onPressed: null,
                      color: Colors.brown,
                      child: Text('PAY', style: TextStyle(color: Colors.white)))
                ],
              ),
            )));
  }
}
