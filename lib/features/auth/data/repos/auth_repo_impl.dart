import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, void>> loginUserMethod(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, void>> singUpUserMethod(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPasswordMethod(
      {required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, void>> googleLogin() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        return left(
          FirebaseAuthExcep(
            errorMessage: 'Google login canceled',
          ),
        );
      }
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          FirebaseAuthExcep.fromFireException(
            errorCode: e.code,
          ),
        );
      } else {
        return left(
          FirebaseAuthExcep(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
