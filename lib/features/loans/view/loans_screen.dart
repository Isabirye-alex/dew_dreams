import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({super.key});

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
          // Active Loan Overview
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
              children: const [
                Text(
                  "Active Loan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Loan Amount: UGX 1,200,000"),
                SizedBox(height: 4),
                Text("Remaining Balance: UGX 800,000"),
                SizedBox(height: 4),
                Text("Next Payment: 20 March 2026"),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Quick Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _LoanAction(icon: Icons.payment, label: "Pay Loan"),
              _LoanAction(icon: Icons.add_box, label: "Request Loan"),
            ],
          ),

          const SizedBox(height: 24),

          // Loan Progress / Repayment
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
                  "Repayment Progress",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text("UGX 400,000 / 1,200,000 repaid"),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.33,
                    minHeight: 10,
                    backgroundColor: AColorTheme.darkCard,
                    valueColor: AlwaysStoppedAnimation(AColorTheme.primary),
                  ),
                ),
                const SizedBox(height: 6),
                const Text("33% completed"),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Loan History
          const Text(
            "Loan History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const LoanTransactionTile(
            title: "Loan Request Approved",
            amount: "UGX 1,200,000",
            date: "01 Feb 2026",
            color: Colors.blue,
          ),
          const LoanTransactionTile(
            title: "Loan Payment",
            amount: "UGX 400,000",
            date: "10 Feb 2026",
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

// Quick Action Button
class _LoanAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _LoanAction({required this.icon, required this.label});

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

// Loan Transaction Tile
class LoanTransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final Color color;

  const LoanTransactionTile({super.key, 
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
