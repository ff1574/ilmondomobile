import 'package:flutter/material.dart';
import './screens/menu_screen.dart';
import './screens/cart_screen.dart';
import './screens/settings_screen.dart';
import './services/cart.dart';

void main() {
  runApp(const IlMondoMobileApplication());
}

class IlMondoMobileApplication extends StatelessWidget {
  const IlMondoMobileApplication({super.key});

  @override
  Widget build(BuildContext context) {
    Cart cart = Cart(); // Create a shared cart instance

    return MaterialApp(
      home: HomeScreen(cart: cart),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Cart cart;

  const HomeScreen({super.key, required this.cart});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late List<Widget> _pages; // Change this to be set dynamically in initState

  @override
  void initState() {
    super.initState();

    _pages = [
      MenuScreen(cart: widget.cart),
      CartScreen(cart: widget.cart),
      const SettingsScreen()
    ];
  }

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
