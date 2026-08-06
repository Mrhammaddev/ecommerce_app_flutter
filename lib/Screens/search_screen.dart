import 'package:ecommerce_app_flutter/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  List<Product> _results = products;

  final List<String> _recent = [
    'Denim jacket',
    'Sneakers',
    'Handbag',
    'Sweater',
  ];

  void _search(String q) {
    setState(() {
      _results = q.isEmpty
          ? products
          : products
                .where(
                  (p) =>
                      p.name.toLowerCase().contains(q.toLowerCase()) ||
                      p.category.toLowerCase().contains(q.toLowerCase()),
                )
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _search,
              decoration: InputDecoration(
                hintText: 'Search for products, brands...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, color: AppColors.textSecondary),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 18),
            if (_controller.text.isEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Searches',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _recent
                    .map(
                      (r) => GestureDetector(
                        onTap: () {
                          _controller.text = r;
                          _search(r);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(r, style: const TextStyle(fontSize: 13)),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
            ],
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _controller.text.isEmpty
                    ? 'Popular Products'
                    : '${_results.length} results',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.62,
                ),
                itemCount: _results.length,
                itemBuilder: (context, i) => ProductCard(
                  product: _results[i],
                  width: double.infinity,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(product: _results[i]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
