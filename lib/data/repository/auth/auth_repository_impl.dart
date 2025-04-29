import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import '../../models/auth/signin_model.dart';
import '../../models/auth/signup_model.dart';
import '../../sources/auth/auth_firebase_service.dart';
import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<Either> signin(SigninModel model) async {
    return await sl<AuthFirebaseService>().signin(model);
  }

  @override
  Future<Either> signup(SignupModel model) async {
     return await sl<AuthFirebaseService>().signup(model);
  }
}