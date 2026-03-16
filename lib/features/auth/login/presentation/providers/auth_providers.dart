
import 'package:dew_dreams/core/constants/api_constant.dart';
import 'package:dew_dreams/features/auth/login/data/datasources/auth_remote_datasoucre.dart';
import 'package:dew_dreams/features/auth/login/data/repostories/auth_repository_impl.dart';
import 'package:dew_dreams/features/auth/login/domain/usecases/log_in_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Remote Data Source
final authRemoteDataSourceProvider = Provider((ref) {
  return AuthRemoteDataSource(ApiConstants.baseUrl);
});

// Repository
final authRepositoryProvider = Provider((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

// UseCase
final loginUseCaseProvider = Provider((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

