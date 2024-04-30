import 'package:flutter/material.dart';
import '../services/cart.dart'; // Ensure this import is present for Cart and CartItem

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
              itemBuilder: (context, index) => ListTile(
                title: Text(widget.cart.items[index].name),
                subtitle: Text(
                    "Quantity: ${widget.cart.items[index].quantity} - ${widget.cart.items[index].price.toStringAsFixed(2)}€ each"),
                trailing: Text(
                    "Total: ${(widget.cart.items[index].quantity * widget.cart.items[index].price).toStringAsFixed(2)}€"),
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
            // ignore: avoid_print
            onPressed: () => print("Proceed to Checkout"),
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
