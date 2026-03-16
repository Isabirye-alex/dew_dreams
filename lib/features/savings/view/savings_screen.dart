import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

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
          // Total Savings Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? AColorTheme.darkBackground : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: isDark ? Colors.black54 : Colors.black12,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Savings",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  "UGX 560,000",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Account No: 2007 9005 9945"),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Quick Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _SavingsAction(icon: Icons.call_received, label: "Deposit"),
              _SavingsAction(icon: Icons.send, label: "Withdraw"),
              _SavingsAction(icon: Icons.swap_horiz, label: "Transfer"),
            ],
          ),

          const SizedBox(height: 24),

          // Contribution Progress
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AColorTheme.darkBackground : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: isDark ? Colors.black54 : Colors.black12,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Monthly Contribution",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text("UGX 150,000 / 200,000"),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.75,
                    minHeight: 10,
                    backgroundColor: AColorTheme.darkCard,
                    valueColor: AlwaysStoppedAnimation(AColorTheme.secondary),
                  ),
                ),
                const SizedBox(height: 6),
                const Text("75% completed"),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Savings History / Transactions
          const Text(
            "Savings History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const SavingsTransactionTile(
            title: "Deposit",
            amount: "+ UGX 100,000",
            date: "01 March 2026",
            color: Colors.green,
          ),
          const SavingsTransactionTile(
            title: "Deposit",
            amount: "+ UGX 200,000",
            date: "15 February 2026",
            color: Colors.green,
          ),
          const SavingsTransactionTile(
            title: "Withdrawal",
            amount: "- UGX 50,000",
            date: "20 February 2026",
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

// Quick Action Widget
class _SavingsAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SavingsAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AColorTheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AColorTheme.primary),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}

// Savings Transaction Tile
class SavingsTransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final Color color;

  const SavingsTransactionTile({super.key, 
    required this.title,
    required this.amount,
    required this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(Icons.swap_horiz, color: color),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
      tileColor: isDark ? AColorTheme.darkBackground : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
