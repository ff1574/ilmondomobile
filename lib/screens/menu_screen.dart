import 'dart:convert';
import 'package:flutter/material.dart';
import '../widgets/food_item.dart';
import '../widgets/food_item_modal.dart';
import '../services/cart.dart'; // Ensure Cart and CartItem classes are available

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> jsonData;
  final Cart cart;

  MenuScreen({super.key, required this.cart})
      : jsonData = List<Map<String, dynamic>>.from(jsonDecode('''[
    {"name":"Pepperoni","price":"€8.99","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"},
    {"name":"Spinach and Feta","price":"€10.49","image":"http://dummyimage.com/300x300.png/ff4444/ffffff"},
    {"name":"Pepperoni","price":"€7.50","image":"http://dummyimage.com/300x300.png/dddddd/000000"},
    {"name":"Margherita","price":"€6.00","image":"http://dummyimage.com/300x300.png/cc0000/ffffff"},
    {"name":"Artichoke and Sun-Dried Tomato","price":"€12.00","image":"http://dummyimage.com/300x300.png/dddddd/000000"},
    {"name":"Artichoke and Sun-Dried Tomato","price":"€11.99","image":"http://dummyimage.com/300x300.png/cc0000/ffffff"},
    {"name":"Meat Lovers","price":"€13.99","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"},
    {"name":"Hawaiian","price":"€9.00","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"},
    {"name":"Mushroom and Olive","price":"€7.99","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"},
    {"name":"Pesto and Tomato","price":"€8.49","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"},
    {"name":"Pesto and Tomato","price":"€8.00","image":"http://dummyimage.com/300x300.png/ff4444/ffffff"},
    {"name":"Pepperoni","price":"€7.99","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"},
    {"name":"Artichoke and Sun-Dried Tomato","price":"€10.99","image":"http://dummyimage.com/300x300.png/cc0000/ffffff"},
    {"name":"Spinach and Feta","price":"€9.50","image":"http://dummyimage.com/300x300.png/5fa2dd/ffffff"}
  ]'''));

  List<FoodItem> _convertJsonToFoodItems(BuildContext context) {
    return jsonData
        .map((item) => FoodItem(
              name: item['name'],
              price: double.tryParse(
                      item['price'].replaceAll("€", "").replaceAll(",", ".")) ??
                  0.00,
              image: item['image'],
              onClick: () => showDialog(
                context: context,
                builder: (context) => FoodItemModal(
                  name: item['name'],
                  price: double.tryParse(item['price']
                          .replaceAll("€", "")
                          .replaceAll(",", ".")) ??
                      0.00,
                  image: item['image'],
                  cart: cart,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems = _convertJsonToFoodItems(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: foodItems.length,
        itemBuilder: (context, index) => foodItems[index],
      ),
    );
  }
}
