
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signup_model.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either, SignupModel>{

  @override
  Future<Either> call({SignupModel ? params}) {
    return sl<AuthRepository>().signup(params!);
  }

  
}