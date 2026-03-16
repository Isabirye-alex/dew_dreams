import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:dew_dreams/reusables/transactions_tile.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Recent Transactions",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TransactionTile(
          title: "Deposit",
          amount: "UGX 100,000",
          sign: "+",
          color: AColorTheme.secondary,
        ),
        TransactionTile(
          title: "Loan Payment",
          amount: "UGX 50,000",
          sign: "-",
          color: AColorTheme.error,
        ),
      ],
    );
  }
}
