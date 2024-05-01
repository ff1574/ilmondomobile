import 'package:flutter/material.dart';
import '../services/cart.dart';

class FoodItemModal extends StatefulWidget {
  final String name;
  final double price;
  final String image;
  final Cart cart;

  const FoodItemModal({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.cart,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FoodItemModalState createState() => _FoodItemModalState();
}

class _FoodItemModalState extends State<FoodItemModal> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.name),
      content: SingleChildScrollView(
        // Scrollable to avoid overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 300), // Explicit width
              child: Image.network(
                widget.image,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text("Price: ${widget.price.toStringAsFixed(2)}€"),
            const Divider(),
            Row(
              children: [
                const Text("Quantity:"),
                const Spacer(),
                IconButton(
                  onPressed: () => setState(() {
                    if (_quantity > 1) _quantity -= 1;
                  }),
                  icon: const Icon(Icons.remove),
                ),
                Text("$_quantity"),
                IconButton(
                  onPressed: () => setState(() => _quantity += 1),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            widget.cart.addItem(CartItem(
              name: widget.name,
              price: widget.price,
              quantity: _quantity,
              image: widget.image,
            ));
            Navigator.of(context).pop();
          },
          child: const Text("Add to Cart"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
      ],
    );
  }
}
