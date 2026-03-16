import 'package:dew_dreams/core/constants/app_constants.dart/logo_url.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // LOGO
        Image.asset(LogoUrl.logourl, height: 110),

        const SizedBox(height: 30),

        // TITLE
        Text(
          "Welcome Back",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        // SUBTITLE
        Text(
          "Login to your DewDreams SACCO account",
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
