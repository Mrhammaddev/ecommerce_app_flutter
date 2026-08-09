import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../data/cart_state.dart';
import 'LandingScreens/cart.dart';

class ProductDetailView extends StatefulWidget {
	final Product product;

	const ProductDetailView({super.key, required this.product});

	@override
	State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
	late String selectedSize;
	int selectedColor = 0;
	int quantity = 1;
	bool favorite = false;

	@override
	void initState() {
		super.initState();
		selectedSize = widget.product.sizes.contains('M')
				? 'M'
				: widget.product.sizes.first;
		favorite = CartState.instance.wishlist.contains(widget.product.id);
	}

	void _toggleFavorite() {
		setState(() {
			favorite = !favorite;
		});
		CartState.instance.toggleWishlist(widget.product.id);
	}

	void _changeQuantity(int delta) {
		setState(() {
			final next = quantity + delta;
			if (next < 1) {
				return;
			}
			quantity = next;
		});
	}

	void _addToCart() {
		CartState.instance.addToCart(
			widget.product,
			size: selectedSize,
			quantity: quantity,
		);

		ScaffoldMessenger.of(context).showSnackBar(
			const SnackBar(content: Text('Added to cart')),
		);
	}

	Widget _topActionButton(BuildContext context, IconData icon, VoidCallback onTap) {
		return GestureDetector(
			onTap: onTap,
			child: Container(
				height: 42,
				width: 42,
				decoration: BoxDecoration(
					color: Theme.of(context).scaffoldBackgroundColor,
					shape: BoxShape.circle,
					border: Border.all(
						color: Theme.of(context).focusColor.withValues(alpha: 0.25),
					),
					boxShadow: [
						BoxShadow(
							color: Colors.black.withValues(alpha: 0.06),
							blurRadius: 16,
							offset: const Offset(0, 8),
						),
					],
				),
				child: Icon(icon, size: 20),
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		final p = widget.product;
		final isDark = Theme.of(context).brightness == Brightness.dark;
		final total = p.price * quantity;

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
							top: -100,
							right: -40,
							child: Container(
								height: 240,
								width: 240,
								decoration: BoxDecoration(
									shape: BoxShape.circle,
									color: const Color(0xFFC8A56A).withValues(alpha: 0.12),
								),
							),
						),
						SafeArea(
							child: Column(
								children: [
									Expanded(
										child: SingleChildScrollView(
											padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Row(
														children: [
															_topActionButton(
																context,
																CupertinoIcons.back,
																() => Navigator.of(context).pop(),
															),
															const Spacer(),
															_topActionButton(
																context,
																favorite
																		? CupertinoIcons.heart_fill
																		: CupertinoIcons.heart,
																_toggleFavorite,
															),
														],
													),
													const SizedBox(height: 16),
													Container(
														width: double.infinity,
														padding: const EdgeInsets.all(16),
														decoration: BoxDecoration(
															color: Theme.of(context).scaffoldBackgroundColor,
															borderRadius: BorderRadius.circular(24),
															border: Border.all(
																color: Theme.of(context).focusColor.withValues(alpha: 0.22),
															),
															boxShadow: [
																BoxShadow(
																	color: Colors.black.withValues(alpha: 0.06),
																	blurRadius: 22,
																	offset: const Offset(0, 12),
																),
															],
														),
														child: Column(
															children: [
																Hero(
																	tag: p.id,
																	child: SizedBox(
																		height: 280,
																		child: Image.asset(p.image, fit: BoxFit.contain),
																	),
																),
																const SizedBox(height: 14),
																Row(
																	mainAxisAlignment: MainAxisAlignment.spaceEvenly,
																	children: List.generate(
																		3,
																		(index) => Container(
																			height: 6,
																			width: index == 0 ? 24 : 6,
																			decoration: BoxDecoration(
																				color: index == 0
																						? const Color(0xFFC8A56A)
																						: Theme.of(context).focusColor,
																				borderRadius: BorderRadius.circular(999),
																			),
																		),
																	),
																),
															],
														),
													),
													const SizedBox(height: 18),
													Row(
														crossAxisAlignment: CrossAxisAlignment.start,
														children: [
															Expanded(
																child: Column(
																	crossAxisAlignment: CrossAxisAlignment.start,
																	children: [
																		Text(
																			p.category,
																			style: Theme.of(context).textTheme.labelSmall!.copyWith(
																				fontWeight: FontWeight.w600,
																			),
																		),
																		const SizedBox(height: 4),
																		Text(
																			p.name,
																			style: Theme.of(context).textTheme.headlineSmall!.copyWith(
																				fontWeight: FontWeight.w700,
																			),
																		),
																	],
																),
															),
															Text(
																'\$${p.price.toStringAsFixed(2)}',
																style: Theme.of(context).textTheme.headlineSmall!.copyWith(
																	fontWeight: FontWeight.w800,
																),
															),
														],
													),
													const SizedBox(height: 10),
													Row(
														children: [
															const Icon(Icons.star_rounded, color: Color(0xFFF6B800), size: 18),
															const SizedBox(width: 4),
															Text(
																p.rating.toStringAsFixed(1),
																style: Theme.of(context).textTheme.bodySmall!.copyWith(
																	fontWeight: FontWeight.w700,
																),
															),
															const SizedBox(width: 6),
															Text(
																'(${p.reviews} reviews)',
																style: Theme.of(context).textTheme.labelSmall,
															),
														],
													),
													const SizedBox(height: 16),
													Text(
														'Description',
														style: Theme.of(context).textTheme.titleMedium,
													),
													const SizedBox(height: 8),
													Text(
														p.description,
														style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.5),
													),
													const SizedBox(height: 16),
													if (p.colors.isNotEmpty) ...[
														Text(
															'Color',
															style: Theme.of(context).textTheme.titleMedium,
														),
														const SizedBox(height: 10),
														Wrap(
															spacing: 10,
															runSpacing: 10,
															children: List.generate(p.colors.length, (index) {
																final selected = selectedColor == index;
																return GestureDetector(
																	onTap: () {
																		setState(() {
																			selectedColor = index;
																		});
																	},
																	child: Container(
																		padding: const EdgeInsets.symmetric(
																			horizontal: 14,
																			vertical: 8,
																		),
																		decoration: BoxDecoration(
																			color: selected
																					? const Color(0xFFC8A56A).withValues(alpha: 0.2)
																					: Theme.of(context).scaffoldBackgroundColor,
																			borderRadius: BorderRadius.circular(10),
																			border: Border.all(
																				color: selected
																						? const Color(0xFFC8A56A)
																						: Theme.of(context).focusColor.withValues(alpha: 0.4),
																			),
																		),
																		child: Text(
																			p.colors[index],
																			style: Theme.of(context).textTheme.bodySmall!.copyWith(
																				fontWeight: FontWeight.w600,
																			),
																		),
																	),
																);
															}),
														),
														const SizedBox(height: 16),
													],
													Text(
														'Size',
														style: Theme.of(context).textTheme.titleMedium,
													),
													const SizedBox(height: 10),
													Wrap(
														spacing: 10,
														children: p.sizes.map((size) {
															final selected = selectedSize == size;
															return GestureDetector(
																onTap: () {
																	setState(() {
																		selectedSize = size;
																	});
																},
																child: Container(
																	width: 46,
																	height: 46,
																	alignment: Alignment.center,
																	decoration: BoxDecoration(
																		color: selected
																				? Theme.of(context).secondaryHeaderColor
																				: Theme.of(context).scaffoldBackgroundColor,
																		borderRadius: BorderRadius.circular(12),
																		border: Border.all(
																			color: selected
																					? Theme.of(context).secondaryHeaderColor
																					: Theme.of(context).focusColor.withValues(alpha: 0.4),
																		),
																	),
																	child: Text(
																		size,
																		style: Theme.of(context).textTheme.bodySmall!.copyWith(
																			color: selected
																					? Theme.of(context).textTheme.displaySmall!.color
																					: null,
																			fontWeight: FontWeight.w700,
																		),
																	),
																),
															);
														}).toList(),
													),
												],
											),
										),
									),
									Container(
										padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
										decoration: BoxDecoration(
											color: Theme.of(context).scaffoldBackgroundColor,
											border: Border(
												top: BorderSide(
													color: Theme.of(context).focusColor.withValues(alpha: 0.28),
												),
											),
										),
										child: Column(
											children: [
												Row(
													children: [
														Container(
															height: 46,
															width: 120,
															decoration: BoxDecoration(
																color: Theme.of(context).focusColor.withValues(alpha: 0.3),
																borderRadius: BorderRadius.circular(12),
															),
															child: Row(
																mainAxisAlignment: MainAxisAlignment.spaceEvenly,
																children: [
																	InkWell(
																		onTap: () => _changeQuantity(-1),
																		child: const Icon(Icons.remove, size: 18),
																	),
																	Text(
																		'$quantity',
																		style: Theme.of(context).textTheme.titleSmall,
																	),
																	InkWell(
																		onTap: () => _changeQuantity(1),
																		child: const Icon(Icons.add, size: 18),
																	),
																],
															),
														),
														const SizedBox(width: 12),
														Expanded(
															child: Column(
																crossAxisAlignment: CrossAxisAlignment.start,
																children: [
																	Text('Total', style: Theme.of(context).textTheme.labelSmall),
																	Text(
																		'\$${total.toStringAsFixed(2)}',
																		style: Theme.of(context).textTheme.titleMedium!.copyWith(
																			fontWeight: FontWeight.w800,
																		),
																	),
																],
															),
														),
													],
												),
												const SizedBox(height: 12),
												Row(
													children: [
														Expanded(
															child: OutlinedButton(
																onPressed: _addToCart,
																style: OutlinedButton.styleFrom(
																	minimumSize: const Size.fromHeight(54),
																	side: BorderSide(
																		color: Theme.of(context).secondaryHeaderColor,
																	),
																	shape: RoundedRectangleBorder(
																		borderRadius: BorderRadius.circular(14),
																	),
																),
																child: Icon(
																	Icons.add_shopping_cart_rounded,
																	color: Theme.of(context).secondaryHeaderColor,
																),
															),
														),
														const SizedBox(width: 10),
														Expanded(
															flex: 3,
															child: ElevatedButton(
																onPressed: () {
																	_addToCart();
																	Navigator.of(context).push(
																		MaterialPageRoute(
																			builder: (_) => const CartView(),
																		),
																	);
																},
																style: ElevatedButton.styleFrom(
																	minimumSize: const Size.fromHeight(54),
																	backgroundColor: Theme.of(context).secondaryHeaderColor,
																	foregroundColor: Theme.of(context).textTheme.displaySmall!.color,
																	shape: RoundedRectangleBorder(
																		borderRadius: BorderRadius.circular(14),
																	),
																),
																child: const Text('Buy Now'),
															),
														),
													],
												),
											],
										),
									),
								],
							),
						),
					],
				),
			),
		);
	}
}

