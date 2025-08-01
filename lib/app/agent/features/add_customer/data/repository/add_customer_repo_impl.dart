import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/repository/add_customer_repo.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/core/errors/failure.dart';
import 'package:sales_system_demo/app/core/services/firebase_service.dart';

class AddCustomerRepoImpl implements AddCustomerRepo {
  final FirebaseService firebaseService = FirebaseService();
  @override
  Future<Either<Failure, void>> addCustomer(CustomerModel customer) async {
    try {
      await firebaseService.firestore
          .collection("customers")
          .doc(customer.id)
          .set(customer.toJson());
      return const Right(null);
    } on FirebaseException catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    } catch (error) {
      debugPrint("Error in AddCustomerRepoImpl $error");
      return Left(FirebaseFailure("An unknown error occurred"));
    }
  }
}
