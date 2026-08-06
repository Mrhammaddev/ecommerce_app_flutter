import 'package:flutter/material.dart';
import '../data/cart_state.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartState.instance,
      builder: (context, _) {
        final ids = CartState.instance.wishlist;
        final items = products.where((p) => ids.contains(p.id)).toList();
        // Fallback: show a curated set if nothing saved yet, so the screen
        // never looks empty during a demo.
        final display = items.isNotEmpty ? items : products.take(6).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Wishlist'),
            automaticallyImplyLeading: false,
          ),
          body: display.isEmpty
              ? const Center(child: Text('No items yet'))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.62,
                    ),
                    itemCount: display.length,
                    itemBuilder: (context, i) => ProductCard(
                      product: display[i],
                      width: double.infinity,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: display[i]),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
