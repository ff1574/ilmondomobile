import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final VoidCallback onClick;

  const FoodItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        // Wrap with Card for better UI and elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use min size that fits the child
            children: [
              Image.network(
                image,
                height: 120, // Fixed height for images
                width: double.infinity, // Image takes the width of the card
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2, // Allow text to take up to two lines
                  overflow:
                      TextOverflow.ellipsis, // Ellipsis to prevent overflow
                ),
              ),
              Text(
                "${price.toStringAsFixed(2)}€",
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
