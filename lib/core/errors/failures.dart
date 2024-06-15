abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class FirebaseAuthExcep extends Failure {
  FirebaseAuthExcep({required super.errorMessage});

  factory FirebaseAuthExcep.fromFireException({required String errorCode}) {
    if (errorCode == 'user-not-found') {
      return FirebaseAuthExcep(errorMessage: 'No user found for that email.');
    } else if (errorCode == 'there is no user with this data') {
      return FirebaseAuthExcep(
          errorMessage:
              'The supplied auth credential is malformed or has expired.');
    } else if (errorCode == 'wrong-password') {
      return FirebaseAuthExcep(
          errorMessage: 'Wrong password provided for that user.');
    } else if (errorCode == 'weak-password') {
      return FirebaseAuthExcep(
          errorMessage: 'The password provided is too weak.');
    } else if (errorCode == 'email-already-in-use') {
      return FirebaseAuthExcep(
          errorMessage: 'The account already exists for that email.');
    } else {
      return FirebaseAuthExcep(errorMessage: errorCode);
    }
  }
}
