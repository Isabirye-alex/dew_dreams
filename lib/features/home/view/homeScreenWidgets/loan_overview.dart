import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class LoanOverviewCard extends StatelessWidget {
  const LoanOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AColorTheme.info : AColorTheme.border,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(blurRadius: 10, color: AColorTheme.darkBackground),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Active Loan", style: TextTheme.of(context).titleLarge),
          SizedBox(height: 8),
          Text("Loan Amount: UGX 1,200,000"),
          SizedBox(height: 4),
          Text("Remaining Balance: UGX 800,000"),
          SizedBox(height: 4),
          Text("Next Payment: 20 March 2026"),
        ],
      ),
    );
  }
}
