import 'package:flutter/material.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';

class ContributionProgress extends StatelessWidget {
  final double progress;

  const ContributionProgress({super.key, this.progress = 0.78});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AColorTheme.accent : AColorTheme.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Monthly Contribution", style: TextTheme.of(context).bodySmall),
          const SizedBox(height: 10),

          Text("UGX 150,000 / 200,000", style: TextTheme.of(context).bodySmall),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: AColorTheme.darkCard,
              valueColor: const AlwaysStoppedAnimation(AColorTheme.secondary),
            ),
          ),

          const SizedBox(height: 6),
          Text("${(progress * 100).toInt()}% completed"),
        ],
      ),
    );
  }
}
