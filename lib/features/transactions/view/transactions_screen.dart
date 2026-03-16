import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Example transactions
    final transactions = [
      {
        "title": "Deposit",
        "amount": "+ UGX 100,000",
        "date": "01 March 2026",
        "color": Colors.green,
      },
      {
        "title": "Loan Payment",
        "amount": "- UGX 50,000",
        "date": "05 March 2026",
        "color": Colors.red,
      },
      {
        "title": "Deposit",
        "amount": "+ UGX 200,000",
        "date": "15 February 2026",
        "color": Colors.green,
      },
      {
        "title": "Withdrawal",
        "amount": "- UGX 50,000",
        "date": "20 February 2026",
        "color": Colors.red,
      },
    ];

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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return TransactionCard(
            title: tx["title"] as String,
            amount: tx["amount"] as String,
            date: tx["date"] as String,
            color: tx["color"] as Color,
            isDark: isDark,
          );
        },
      ),
    );
  }
}

// Transaction Card Widget
class TransactionCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final Color color;
  final bool isDark;

  const TransactionCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? AColorTheme.darkBackground : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(Icons.swap_horiz, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          date,
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
        ),
        trailing: Text(
          amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
