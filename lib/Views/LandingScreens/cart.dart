import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/images.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Roller Rabbit',
      'subtitle': 'Vado Odelle Dress',
      'price': 198.0,
      'image': Images.SHOE4,
      'quantity': 1,
    },
    {
      'title': 'Axel Arigato',
      'subtitle': 'Clean 90 Triple Sneakers',
      'price': 245.0,
      'image': Images.SHOE1,
      'quantity': 1,
    },
    {
      'title': 'Herschel Supply Co.',
      'subtitle': 'Daypack Backpack',
      'price': 40.0,
      'image': Images.BAG,
      'quantity': 1,
    },
  ];

  int get itemCount => cartItems.fold<int>(
    0,
    (total, item) => total + (item['quantity'] as int),
  );

  double get totalPrice => cartItems.fold<double>(
    0,
    (total, item) =>
        total + (item['price'] as double) * (item['quantity'] as int),
  );

  void _updateQuantity(int index, int delta) {
    setState(() {
      final current = cartItems[index]['quantity'] as int;
      final next = current + delta;
      if (next < 1) {
        return;
      }
      cartItems[index]['quantity'] = next;
    });
  }

  Widget _quantityControl(int index) {
    final quantity = cartItems[index]['quantity'] as int;
    return Container(
      height: 36,
      width: 106,
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Theme.of(context).focusColor.withValues(alpha: 0.45),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _updateQuantity(index, -1),
            child: const Icon(Icons.remove, size: 15),
          ),
          Text(
            '$quantity',
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _updateQuantity(index, 1),
            child: const Icon(Icons.add, size: 15),
          ),
        ],
      ),
    );
  }

  Widget _cartCard(int index) {
    final item = cartItems[index];
    final title = item['title'] as String;
    final subtitle = item['subtitle'] as String;
    final price = item['price'] as double;
    final image = item['image'] as String;

    return Stack(
      children: [
        // if (showDeleteAction)
        //   Positioned.fill(
        //     child: Align(
        //       alignment: Alignment.centerRight,
        //       child: Container(
        //         width: 64,
        //         decoration: BoxDecoration(
        //           color: Colors.black,
        //           borderRadius: BorderRadius.circular(16),
        //         ),
        //         child: const Icon(CupertinoIcons.delete, color: Colors.white),
        //       ),
        //     ),
        //   ),
        Container(
          // margin: EdgeInsets.only(right: showDeleteAction ? 44 : 0),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).focusColor.withValues(alpha: 0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        _quantityControl(index),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.titleSmall!.color;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF121212), const Color(0xFF1B1B1B)]
                : [const Color(0xFFF8F7F4), const Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -70,
              right: -40,
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFC8A56A).withValues(alpha: 0.12),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Cart',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$itemCount items ready for checkout',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Spacer(),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).focusColor.withValues(alpha: 0.22),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 16,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Icon(
                                CupertinoIcons.bag,
                                size: 19,
                                color: textColor,
                              ),
                            ),
                            Positioned(
                              top: -2,
                              right: -2,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$itemCount',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: ListView.separated(
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return _cartCard(index);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // const Spacer(),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).focusColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).focusColor.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Promo Code',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.18),
                                  blurRadius: 14,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Apply',
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Total ($itemCount item):',
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).textTheme.labelSmall!.color,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${totalPrice.toStringAsFixed(0)}',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      height: 58,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF101010), Color(0xFF2A2A2A)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.22),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Proceed to Checkout',
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC8A56A),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: const Icon(
                              CupertinoIcons.arrow_right,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
