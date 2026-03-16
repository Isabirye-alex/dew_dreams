import 'package:dew_dreams/features/auth/login/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String userName, String password);
}
