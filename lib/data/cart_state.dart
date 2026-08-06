import 'package:flutter/foundation.dart';
import '../models/product.dart';

/// A minimal, dependency-free cart store shared across screens.
class CartState extends ChangeNotifier {
  CartState._internal();
  static final CartState instance = CartState._internal();

  final List<CartItem> _items = [];
  final Set<String> _wishlist = {};

  List<CartItem> get items => List.unmodifiable(_items);
  Set<String> get wishlist => _wishlist;

  int get itemCount => _items.fold(0, (sum, i) => sum + i.quantity);

  double get subtotal => _items.fold(0, (sum, i) => sum + i.total);
  double get shipping => _items.isEmpty ? 0 : 5.99;
  double get total => subtotal + shipping;

  void addToCart(Product product, {String size = 'M', int quantity = 1}) {
    final existing = _items.indexWhere(
      (i) => i.product.id == product.id && i.size == size,
    );
    if (existing >= 0) {
      _items[existing].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, size: size, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      removeFromCart(item);
      return;
    }
    item.quantity = quantity;
    notifyListeners();
  }

  void toggleWishlist(String productId) {
    if (_wishlist.contains(productId)) {
      _wishlist.remove(productId);
    } else {
      _wishlist.add(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
