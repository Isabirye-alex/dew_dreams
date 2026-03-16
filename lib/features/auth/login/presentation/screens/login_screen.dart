import 'package:dew_dreams/features/auth/login/presentation/widgets/login_form.dart';
import 'package:dew_dreams/features/auth/login/presentation/widgets/login_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: const [
          SizedBox(height: 50),
          LoginHeader(),
          SizedBox(height: 40),
          LoginForm(),
        ],
      ),
    );
  }
}
