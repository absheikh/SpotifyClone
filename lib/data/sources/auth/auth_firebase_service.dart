import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/signin_model.dart';
import '../../models/auth/signup_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninModel model);
  Future<Either> signup(SignupModel model);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either> signin(SigninModel model) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> signup(SignupModel model) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      await userCredential.user?.updateDisplayName(model.fullName);
      await userCredential.user?.reload();

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      String message = "";
      if(e.code == "weak-password"){
        message = "Password provided is too weak";
      } else if(e.code == "email-already-in-use"){
        message = "An account already exists with that email";
      }
      return Left(message);
    }
  }
}
