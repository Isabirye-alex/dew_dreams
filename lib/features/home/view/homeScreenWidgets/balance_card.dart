import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AColorTheme.primary, AColorTheme.primaryDark],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Account Number", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 4),
          Text(
            "2007 9005 9945",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 20),
          Text("Total Savings", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 4),
          Text(
            "UGX 560,000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
