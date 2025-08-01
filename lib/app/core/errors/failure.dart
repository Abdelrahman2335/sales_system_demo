import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

// Important to know that here we are using factory pattern, this useful as it's
// Hide Complex Logic, Encapsulation of Creation Logic, Single Responsibility, Testability

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errorMessage);

  factory FirebaseFailure.fromFirebaseException(FirebaseException exception) {
    switch (exception.code) {
      case "permission-denied":
        return FirebaseFailure(
          "You do not have permission to perform this action.",
        );
      default:
        return FirebaseFailure(
          exception.message ?? "An unknown error occurred, Please try again later",
        );
    }
  }
}
