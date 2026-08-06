import 'package:flutter/material.dart';
import '../../Theme/theme_service.dart';
import '../../Utils/images.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget _actionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    bool showArrow = true,
    bool danger = false,
  }) {
    final textColor = danger
        ? const Color(0xFFD24B4B)
        : Theme.of(context).textTheme.titleSmall!.color;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).focusColor.withValues(alpha: 0.24),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: textColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null)
                  Text(subtitle, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          if (showArrow)
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Theme.of(context).textTheme.labelSmall!.color,
            ),
        ],
      ),
    );
  }

  Widget _statItem(BuildContext context, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
              top: -80,
              right: -30,
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFC8A56A).withValues(alpha: 0.11),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                          onPressed: ThemeService().switchTheme,
                          icon: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).focusColor.withValues(alpha: 0.25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage(Images.SPLASH),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Malik Hammad',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'hammad.malik@example.com',
                                  style: Theme.of(context).textTheme.labelSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFC8A56A,
                                    ).withValues(alpha: 0.18),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    'Premium Member',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: isDark
                                              ? const Color(0xFFE5C48E)
                                              : const Color(0xFF9A6B2F),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).focusColor.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          _statItem(context, '12', 'Orders'),
                          Container(
                            height: 34,
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                          _statItem(context, '4', 'Wishlist'),
                          Container(
                            height: 34,
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                          _statItem(context, '2', 'Coupons'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Account',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    _actionTile(
                      context,
                      icon: Icons.person_outline_rounded,
                      title: 'Personal Details',
                      subtitle: 'Profile, phone, and address',
                    ),
                    _actionTile(
                      context,
                      icon: Icons.local_shipping_outlined,
                      title: 'My Orders',
                      subtitle: 'Track and manage your orders',
                    ),
                    _actionTile(
                      context,
                      icon: Icons.favorite_border_rounded,
                      title: 'Wishlist',
                      subtitle: 'Saved products for later',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Preferences',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    _actionTile(
                      context,
                      icon: Icons.notifications_none_rounded,
                      title: 'Notifications',
                      subtitle: 'Manage push alerts',
                    ),
                    _actionTile(
                      context,
                      icon: Icons.credit_card_outlined,
                      title: 'Payment Methods',
                      subtitle: 'Cards and wallet settings',
                    ),
                    _actionTile(
                      context,
                      icon: Icons.settings_outlined,
                      title: 'App Settings',
                      subtitle: 'Language, theme, and privacy',
                    ),
                    const SizedBox(height: 8),
                    _actionTile(
                      context,
                      icon: Icons.logout_rounded,
                      title: 'Sign Out',
                      showArrow: false,
                      danger: true,
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
