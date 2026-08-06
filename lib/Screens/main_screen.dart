import 'package:ecommerce_app_flutter/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import '../data/cart_state.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'wishlist_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _tab = 0;

  final _screens = const [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartState.instance,
      builder: (context, _) {
        final cartCount = CartState.instance.itemCount;
        return Scaffold(
          body: IndexedStack(index: _tab, children: _screens),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.resolveWith((states) {
                final selected = states.contains(MaterialState.selected);
                return TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected ? AppColors.primary : AppColors.textSecondary,
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: _tab,
              onDestinationSelected: (i) => setState(() => _tab = i),
              backgroundColor: Colors.white,
              elevation: 8,
              height: 66,
              destinations: [
                const NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                    color: AppColors.textSecondary,
                  ),
                  selectedIcon: Icon(Icons.home, color: AppColors.primary),
                  label: 'Home',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.search, color: AppColors.textSecondary),
                  selectedIcon: Icon(Icons.search, color: AppColors.primary),
                  label: 'Search',
                ),
                const NavigationDestination(
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColors.textSecondary,
                  ),
                  selectedIcon: Icon(Icons.favorite, color: AppColors.primary),
                  label: 'Wishlist',
                ),
                NavigationDestination(
                  icon: Badge(
                    label: Text('$cartCount'),
                    isLabelVisible: cartCount > 0,
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  selectedIcon: Badge(
                    label: Text('$cartCount'),
                    isLabelVisible: cartCount > 0,
                    child: const Icon(
                      Icons.shopping_bag,
                      color: AppColors.primary,
                    ),
                  ),
                  label: 'Cart',
                ),
                const NavigationDestination(
                  icon: Icon(
                    Icons.person_outline,
                    color: AppColors.textSecondary,
                  ),
                  selectedIcon: Icon(Icons.person, color: AppColors.primary),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
