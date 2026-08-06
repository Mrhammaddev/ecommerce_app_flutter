class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String image;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final List<String> sizes;
  final List<String> colors;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.image,
    this.rating = 4.5,
    this.reviews = 0,
    this.isFavorite = false,
    this.sizes = const ['S', 'M', 'L', 'XL'],
    this.colors = const [],
    this.description =
        'A timeless staple piece crafted from premium materials, '
        'designed for everyday comfort without compromising on style. '
        'Pairs effortlessly with the rest of your wardrobe.',
  });
}

class CartItem {
  final Product product;
  int quantity;
  String size;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.size = 'M',
  });

  double get total => product.price * quantity;
}
