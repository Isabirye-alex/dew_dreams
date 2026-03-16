import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      backgroundColor: isDark ? AColorTheme.darkBackground : Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(color: AColorTheme.primary.withAlpha(70)),
          ),

          /// 🔷 HEADER SECTION
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(color: AColorTheme.primary.withAlpha(70)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      LogoUrl.logourl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'DewDreams SACCO',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 MENU ITEMS
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _drawerItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  title: "Dashboard",
                ),
                _drawerItem(
                  context,
                  icon: Icons.savings_outlined,
                  title: "Savings",
                ),
                _drawerItem(
                  context,
                  icon: Icons.account_balance_outlined,
                  title: "Loans",
                ),
                _drawerItem(
                  context,
                  icon: Icons.receipt_long_outlined,
                  title: "Transactions",
                ),
                const Divider(height: 30),
                _drawerItem(
                  context,
                  icon: Icons.settings_outlined,
                  title: "Settings",
                ),
                _drawerItem(
                  context,
                  icon: Icons.logout,
                  title: "Logout",
                  isLogout: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔸 Drawer Item Widget
  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    bool isLogout = false,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon, color: isLogout ? Colors.red : AColorTheme.primary),
      title: Text(
        maxLines: 1,
        title,
        style: TextStyle(
          color: isLogout
              ? Colors.red
              : (isDark ? Colors.white : Colors.black87),
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis
        ),
      ),
      trailing: isLogout
          ? null
          : Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
