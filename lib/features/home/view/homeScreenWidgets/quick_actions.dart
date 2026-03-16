import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _ActionItem(icon: Icons.send, text: "Send"),
        _ActionItem(icon: Icons.call_received, text: "Deposit"),
        _ActionItem(icon: Icons.account_balance, text: "Loan"),
        _ActionItem(icon: Icons.history, text: "History"),
      ],
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ActionItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AColorTheme.primary.withAlpha(50),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AColorTheme.primary),
        ),
        const SizedBox(height: 6),
        Text(text),
      ],
    );
  }
}
