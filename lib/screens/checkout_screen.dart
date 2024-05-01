import 'package:flutter/material.dart';
import '../services/cart.dart';
import '../widgets/google_map_widget.dart'; // Ensure this import is present

class CheckoutScreen extends StatelessWidget {
  final Cart cart;

  const CheckoutScreen({required this.cart, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
              flex: 2, // Give the map more space
              child: GoogleMapWidget(), // Integrate the Google map here
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(cart.items[index].name),
                  subtitle: Text(
                      "Quantity: ${cart.items[index].quantity} - ${cart.items[index].price.toStringAsFixed(2)}€ each"),
                  trailing: Text(
                      "Total: ${(cart.items[index].quantity * cart.items[index].price).toStringAsFixed(2)}€"),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Text("${cart.getTotalPrice().toStringAsFixed(2)}€",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text("Payment Details",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            _PaymentForm(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Clear cart and handle completion logic
                cart.clear();
                Navigator.pop(
                    context); // Optionally return to the home screen or a confirmation screen
              },
              child: const Text("Complete Purchase"),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: "Card Number"),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          decoration: const InputDecoration(labelText: "Expiration Date"),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          decoration: const InputDecoration(labelText: "CVV"),
          keyboardType: TextInputType.number,
          obscureText: true,
        ),
      ],
    );
  }
}
