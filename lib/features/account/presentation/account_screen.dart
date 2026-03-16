import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: isDark ? AColorTheme.background : AColorTheme.background,
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(45),
                child: Image.asset(LogoUrl.logourl, width: 50, height: 50),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning,",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Alex Isabirye",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: isDark ? AColorTheme.background : AColorTheme.darkBackground,
          ),
          SizedBox(width: 12),
          Icon(
            Icons.account_circle_outlined,
            color: isDark ? AColorTheme.background : AColorTheme.darkBackground,
          ),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Picture & Name
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AColorTheme.primary.withOpacity(0.2),
                  child: const Icon(
                    Icons.account_circle,
                    size: 80,
                    color: AColorTheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Alex Isabirye",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Membership ID: 200790059945",
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Account Info Cards
          _accountInfoTile(
            icon: Icons.email_outlined,
            title: "Email",
            value: "alex@example.com",
            isDark: isDark,
          ),
          _accountInfoTile(
            icon: Icons.phone_outlined,
            title: "Phone",
            value: "+256 700 000 000",
            isDark: isDark,
          ),
          _accountInfoTile(
            icon: Icons.location_on_outlined,
            title: "Address",
            value: "Kampala, Uganda",
            isDark: isDark,
          ),

          const SizedBox(height: 24),

          // Preferences
          _preferenceTile(
            icon: Icons.dark_mode_outlined,
            title: "Dark Mode",
            isDark: isDark,
            onToggle: (val) {
              // implement toggle logic
            },
          ),
          _preferenceTile(
            icon: Icons.notifications_none_outlined,
            title: "Notifications",
            isDark: isDark,
            onToggle: (val) {
              // implement toggle logic
            },
          ),

          const SizedBox(height: 24),

          // Logout Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              // implement logout
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _accountInfoTile({
    required IconData icon,
    required String title,
    required String value,
    required bool isDark,
  }) {
    return Card(
      color: isDark ? AColorTheme.darkBackground : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AColorTheme.primary),
        title: Text(title),
        subtitle: Text(
          value,
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
        ),
      ),
    );
  }

  Widget _preferenceTile({
    required IconData icon,
    required String title,
    required bool isDark,
    required Function(bool) onToggle,
  }) {
    return Card(
      color: isDark ? AColorTheme.darkBackground : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AColorTheme.primary),
        title: Text(title),
        trailing: Switch(
          value: isDark,
          onChanged: onToggle,
          activeThumbColor: AColorTheme.primary,
        ),
      ),
    );
  }
}
