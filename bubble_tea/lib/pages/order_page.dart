import 'package:bubble_tea/constants/text_style.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({Key? key, required this.drink}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double sizeValue = 0.5;

  //customize sweet
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

//customize ice
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  //customize pearl
  void customizeSize(double newValue) {
    setState(() {
      sizeValue = newValue;
    });
  }

  //add to cart
  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Succesfully added to cart', style: kmediumText),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name, style: klargeText)),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          Image.asset(widget.drink.imagePath),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Sweet', style: kmediumText),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Ice',
                        style: kmediumText,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Size', style: kmediumText),
                    ),
                    Expanded(
                      child: Slider(
                        value: sizeValue,
                        label: sizeValue.toString(),
                        divisions: 3,
                        onChanged: (value) => customizeSize(value),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          MaterialButton(
            color: Colors.brown,
            onPressed: () => addToCart(),
            child: Text(
              'Add to cart',
              style: kmediumText,
            ),
          )
        ],
      ),
    );
  }
}
