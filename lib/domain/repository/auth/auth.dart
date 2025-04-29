import 'package:dartz/dartz.dart';
import '../../../data/models/auth/signin_model.dart';
import '../../../data/models/auth/signup_model.dart';


abstract class AuthRepository {
  Future<Either> signin(SigninModel model);
  Future<Either> signup(SignupModel model);
}
