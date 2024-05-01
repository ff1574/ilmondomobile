import 'package:flutter/material.dart';
import '../services/cart.dart';
import '../widgets/cart_item_tile.dart';
import './checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({super.key, required this.cart});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (context, index) => CartItemTile(
                item: widget.cart.items[index],
                onIncrease: () =>
                    setState(() => widget.cart.items[index].quantity += 1),
                onDecrease: () => setState(() {
                  if (widget.cart.items[index].quantity > 1) {
                    widget.cart.items[index].quantity -= 1;
                  }
                }),
                onRemove: () => setState(
                    () => widget.cart.removeItem(widget.cart.items[index])),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Price:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text("${widget.cart.getTotalPrice().toStringAsFixed(2)}€",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckoutScreen(
                      cart: widget.cart)), // Navigate to checkout
            ),
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
