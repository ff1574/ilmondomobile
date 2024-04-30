class CartItem {
  final String name;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    var existingItem = items.firstWhere(
      (i) => i.name == item.name,
      orElse: () => CartItem(name: "", price: 0.0, quantity: 0, image: ""),
    );

    if (existingItem.name.isNotEmpty) {
      existingItem.quantity += item.quantity;
    } else {
      items.add(item);
    }
  }

  double getTotalPrice() {
    return items.fold(
        0.0, (total, item) => total + (item.price * item.quantity));
  }

  void clear() {
    items.clear();
  }
}
