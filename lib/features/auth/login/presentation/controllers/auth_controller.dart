import 'package:dew_dreams/features/auth/login/domain/entities/user_entity.dart';
import 'package:dew_dreams/features/auth/login/presentation/providers/auth_providers.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, UserEntity?>(AuthController.new);

class AuthController extends AsyncNotifier<UserEntity?> {
  @override
  Future<UserEntity?> build() async {
    return null; // initial state
  }

  Future<void> login(String userName, String password) async {
    state = const AsyncLoading();

    try {
      final loginUseCase = ref.read(loginUseCaseProvider);

      final user = await loginUseCase.execute(userName, password);
          state = AsyncData(user);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
