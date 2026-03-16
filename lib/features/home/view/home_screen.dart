import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:dew_dreams/core/theme/custom_theme/a_color_theme.dart';
import 'package:dew_dreams/features/account/presentation/widgets/account_dialog.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/alerts_section.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/balance_card.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/contribution_progress.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/loan_overview.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/quick_actions.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/recent_transactions.dart';
import 'package:dew_dreams/features/home/view/homeScreenWidgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:dew_dreams/core/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final GlobalKey _profileIconKey = GlobalKey();

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: isDark
                    ? AColorTheme.primary.withAlpha(60)
                    : AColorTheme.primary.withAlpha(60),
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
          ProfileButton(), 

          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          BalanceCard(),
          SizedBox(height: 24),

          QuickActions(),
          SizedBox(height: 24),

          SummarySection(),
          SizedBox(height: 24),

          LoanOverviewCard(),
          SizedBox(height: 24),

          ContributionProgress(),
          SizedBox(height: 24),

          RecentTransactions(),
          SizedBox(height: 24),

          AlertsSection(),
        ],
      ),
    );
  }
}
