import 'package:dew_dreams/features/auth/login/data/datasources/auth_remote_datasoucre.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> login(String userName, String password) async {
    final userModel = await remoteDataSource.login(userName, password);

    // Convert Model to Entity
    return UserEntity(
      userName: userModel.userName,
      
    );
  }
}
