import 'package:dew_dreams/core/widgets/bottom_nav_bar.dart';
import 'package:dew_dreams/features/auth/login/presentation/screens/login_screen.dart';
// import 'package:dew_dreams/features/account/view/account_screen.dart';
import 'package:dew_dreams/features/home/view/home_screen.dart';
import 'package:dew_dreams/features/loans/view/loans_screen.dart';
import 'package:dew_dreams/features/savings/view/savings_screen.dart';
import 'package:dew_dreams/features/transactions/view/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SavingsScreen(),
    LoansScreen(),
    TransactionsScreen(),
    // AccountScreen(),
    LoginScreen(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Build overlay style dynamically
    final overlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: theme.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onNavItemTapped,
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
