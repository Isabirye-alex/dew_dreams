import 'package:dew_dreams/reusables/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SummaryCard(
            title: "Savings",
            amount: "UGX 560,000",
            icon: Icons.savings,
            color: AColorTheme.secondary,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: SummaryCard(
            title: "Loans",
            amount: "UGX 1,200,000",
            icon: Icons.account_balance_wallet,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
