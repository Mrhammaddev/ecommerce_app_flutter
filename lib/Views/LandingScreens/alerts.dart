import 'package:flutter/material.dart';
import '../../Theme/theme_service.dart';

class AlertView extends StatefulWidget {
  const AlertView({super.key});

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  final List<Map<String, dynamic>> alerts = [
    {
      'title': 'Order Confirmed',
      'message': 'Your order #2145 has been successfully placed.',
      'time': '2m ago',
      'unread': true,
      'today': true,
      'icon': Icons.check_circle_outline_rounded,
    },
    {
      'title': 'Flash Sale Is Live',
      'message': 'Limited-time 40% off on sneakers and accessories.',
      'time': '16m ago',
      'unread': true,
      'today': true,
      'icon': Icons.local_offer_outlined,
    },
    {
      'title': 'Delivery Update',
      'message': 'Your package is out for delivery and arriving today.',
      'time': '1h ago',
      'unread': false,
      'today': true,
      'icon': Icons.local_shipping_outlined,
    },
    {
      'title': 'Payment Successful',
      'message': 'Payment of \$245.00 has been processed successfully.',
      'time': 'Yesterday',
      'unread': false,
      'today': false,
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'title': 'New Collection',
      'message': 'Autumn essentials are now available to explore.',
      'time': 'Yesterday',
      'unread': false,
      'today': false,
      'icon': Icons.auto_awesome_outlined,
    },
  ];

  int get unreadCount => alerts.where((item) => item['unread'] == true).length;

  void _markAllAsRead() {
    setState(() {
      for (final item in alerts) {
        item['unread'] = false;
      }
    });
  }

  Widget _alertTile(BuildContext context, Map<String, dynamic> alert) {
    final isUnread = alert['unread'] == true;
    final icon = alert['icon'] as IconData;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).focusColor.withValues(alpha: 0.24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFC8A56A).withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 20, color: const Color(0xFF9A6B2F)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        alert['title'] as String,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: isUnread
                              ? FontWeight.w700
                              : FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isUnread)
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC8A56A),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  alert['message'] as String,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  alert['time'] as String,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final todayAlerts = alerts.where((item) => item['today'] == true).toList();
    final earlierAlerts = alerts
        .where((item) => item['today'] == false)
        .toList();

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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Alerts',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 10),
                        if (unreadCount > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFC8A56A,
                              ).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '$unreadCount new',
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    color: isDark
                                        ? const Color(0xFFE5C48E)
                                        : const Color(0xFF9A6B2F),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        const Spacer(),
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
                    const SizedBox(height: 2),
                    Text(
                      'Stay updated with your shopping activity',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).focusColor.withValues(alpha: 0.24),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_active_outlined,
                            size: 20,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Push notifications enabled',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          TextButton(
                            onPressed: unreadCount == 0 ? null : _markAllAsRead,
                            child: const Text('Mark all read'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                            'Today',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          ...todayAlerts.map(
                            (item) => _alertTile(context, item),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Earlier',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          ...earlierAlerts.map(
                            (item) => _alertTile(context, item),
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
