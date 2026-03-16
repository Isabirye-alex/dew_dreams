import 'package:dew_dreams/features/auth/login/presentation/controllers/auth_controller.dart';
import 'package:dew_dreams/features/auth/login/presentation/widgets/login_button.dart';
import 'package:dew_dreams/features/auth/login/presentation/widgets/password_field.dart';
import 'package:dew_dreams/features/auth/login/presentation/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void submit() {
    if (!_formKey.currentState!.validate()) return;

    ref
        .read(authControllerProvider.notifier)
        .login(emailController.text.trim(), passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameField(controller: emailController),
          const SizedBox(height: 20),
          PasswordField(
            controller: passwordController,
            obscurePassword: obscurePassword,
            onToggle: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          const SizedBox(height: 25),
          LoginButton(onPressed: submit),
        ],
      ),
    );
  }
}
