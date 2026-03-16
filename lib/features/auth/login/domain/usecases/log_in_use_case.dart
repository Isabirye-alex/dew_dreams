import 'package:dew_dreams/features/auth/login/domain/entities/user_entity.dart';
import 'package:dew_dreams/features/auth/login/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> execute(String userName, String password) {
    return repository.login(userName, password);
  }
}