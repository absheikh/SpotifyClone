
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_model.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninModel>{


  @override
  Future<Either> call({SigninModel ? params}) {
    return sl<AuthRepository>().signin(params!);
  }


}