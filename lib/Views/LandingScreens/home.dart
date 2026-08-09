// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app_flutter/Elements/app_bar.dart';
import 'package:ecommerce_app_flutter/Theme/theme_service.dart';
import 'package:ecommerce_app_flutter/Utils/data.dart';
import 'package:ecommerce_app_flutter/Utils/images.dart';
import 'package:ecommerce_app_flutter/Views/product_detail.dart';
import 'package:ecommerce_app_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedCategory = 0;

  late final List<Product> _featuredProducts = [
    Product(
      id: 'featured-1',
      name: 'Urban Essentials',
      category: 'Shoes',
      price: 249,
      image: shoes4[0],
      rating: 4.8,
      reviews: 124,
      colors: const ['White', 'Black'],
      description:
          'A premium sneaker designed for all-day comfort with a clean, modern silhouette.',
    ),
    Product(
      id: 'featured-2',
      name: 'Street Motion',
      category: 'Shoes',
      price: 219,
      image: shoes4[1],
      rating: 4.7,
      reviews: 98,
      colors: const ['Grey', 'Blue'],
      description:
          'Lightweight everyday trainers that balance soft cushioning with a versatile streetwear look.',
    ),
    Product(
      id: 'featured-3',
      name: 'Velocity Runner',
      category: 'Shoes',
      price: 279,
      image: shoes4[2],
      rating: 4.9,
      reviews: 173,
      colors: const ['Black', 'Orange'],
      description:
          'Performance-inspired sneakers built with responsive support and standout detailing.',
    ),
    Product(
      id: 'featured-4',
      name: 'Classic Court',
      category: 'Shoes',
      price: 189,
      image: shoes4[3],
      rating: 4.6,
      reviews: 86,
      colors: const ['Cream', 'Green'],
      description:
          'A timeless court-style pair with elevated finishing for a sharper casual wardrobe.',
    ),
  ];

  late final List<Product> _newArrivalProducts = [
    Product(
      id: 'arrival-1',
      name: 'Nike Shoes',
      category: 'Shoes',
      price: 789,
      image: shoes4[0],
      rating: 4.8,
      reviews: 142,
      colors: const ['White', 'Red'],
      description:
          'Clean 90 Triple Sneakers deliver a bold statement with premium comfort and sleek styling.',
    ),
    Product(
      id: 'arrival-2',
      name: 'Nike Shoes',
      category: 'Shoes',
      price: 759,
      image: shoes4[1],
      rating: 4.7,
      reviews: 118,
      colors: const ['Grey', 'Black'],
      description:
          'A fresh drop built for daily wear, combining soft support with a refined athletic finish.',
    ),
    Product(
      id: 'arrival-3',
      name: 'Nike Shoes',
      category: 'Shoes',
      price: 799,
      image: shoes4[2],
      rating: 4.9,
      reviews: 167,
      colors: const ['Black', 'Gold'],
      description:
          'Modern sneaker construction with a clean upper and cushioning tuned for long city days.',
    ),
    Product(
      id: 'arrival-4',
      name: 'Nike Shoes',
      category: 'Shoes',
      price: 729,
      image: shoes4[3],
      rating: 4.6,
      reviews: 94,
      colors: const ['White', 'Navy'],
      description:
          'An easy-to-style new arrival that pairs minimal design with durable everyday materials.',
    ),
  ];

  void _openProductDetail(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProductDetailView(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: simpleAppBarWidget(context, ""),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good morning",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Discover your style",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).secondaryHeaderColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: TextFormField(
                  keyboardAppearance: Theme.of(context).brightness,
                  cursorColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Theme.of(context).iconTheme.color,
                        size: 18,
                      ),
                    ),
                    filled: true,
                    fillColor: ThemeService().box.read("isThemeMode") == true
                        ? Theme.of(context).secondaryHeaderColor
                        : const Color(0xffF3F4F5),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search products",
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF121212),
                      const Color(0xFF2A2A2A),
                      const Color(0xFF4A4A4A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              "Limited offer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Fresh looks for every season",
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(color: Colors.white, fontSize: 22),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Up to 50% off selected styles",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: Colors.white70),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                            child: const Text("Shop now"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 120,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(Images.BAG, fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "See all",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesName.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(
                                    context,
                                  ).cardColor.withValues(alpha: 0.65),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categoriesName[index],
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: isSelected
                                      ? Theme.of(
                                          context,
                                        ).textTheme.displaySmall!.color
                                      : null,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured picks",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "View all",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 176,
                child: ListView.builder(
                  itemCount: _featuredProducts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = _featuredProducts[index];
                    return GestureDetector(
                      onTap: () => _openProductDetail(product),
                      child: Container(
                        width: 220,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).cardColor.withValues(alpha: 0.78),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 18,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: Image.asset(
                                    product.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withValues(alpha: 0.14),
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                        child: Text(
                                          "Trending",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.favorite_border,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                  ),
                                  Text(
                                    "Premium comfort",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New arrivals",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "View all",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _newArrivalProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final product = _newArrivalProducts[index];
                  return GestureDetector(
                    onTap: () => _openProductDetail(product),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).cardColor.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 14,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).secondaryHeaderColor.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(Icons.favorite_border, size: 16),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Clean 90 Triple Sneakers",
                            style: Theme.of(context).textTheme.labelSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '\$${product.price.toStringAsFixed(0)}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
