import 'package:flutter/material.dart';
import '../services/cart.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final Function onIncrease;
  final Function onDecrease;
  final Function onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),
                  Text("Price: ${item.price.toStringAsFixed(2)}€"),
                ],
              ),
              Text("Total: ${(item.quantity * item.price).toStringAsFixed(2)}€",
                  style: const TextStyle(fontSize: 16.0)),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantity: ${item.quantity}"),
              Row(
                children: [
                  IconButton(
                    onPressed: () => onIncrease(),
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () => onDecrease(),
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Remove Item"),
                        content: const Text(
                            "Are you sure you want to remove this item from the cart?"),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              onRemove(); // Trigger removal
                              Navigator.of(context).pop(); // Dismiss
                            },
                            child: const Text("Remove"),
                          ),
                        ],
                      ),
                    ),
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
