import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class AlertsSection extends StatelessWidget {
  const AlertsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Alerts", style: TextTheme.of(context).headlineSmall),
        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AColorTheme.info,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AColorTheme.warning),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Loan payment due in 5 days. Tap to pay now.",
                  style: TextTheme.of(context).bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
