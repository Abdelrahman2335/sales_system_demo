import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/repository/agent_dashboard_repo.dart';
import 'package:sales_system_demo/app/core/errors/failure.dart';
import 'package:sales_system_demo/app/core/services/firebase_service.dart';
import 'package:sales_system_demo/app/core/utils/debug_logger.dart';

class AgentDashboardRepoImpl implements AgentDashboardRepo {
  final FirebaseService _firebaseService = FirebaseService();
  @override
  Future<Either<Failure, List<CustomerModel>>> fetchCustomerList({
    required String agentId,
  }) async {
    try {
      final querySnapshot =
          await _firebaseService.firestore
              .collection("customers")
              .where("agentId", isEqualTo: agentId)
              .get();
      final customers =
          querySnapshot.docs
              .map((doc) => CustomerModel.fromJson(doc.data()))
              .toList();

      return Right(customers);
    } on FirebaseException catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    } catch (error) {
      DebugLogger.log("Error in AddCustomerRepoImpl $error");
      return Left(FirebaseFailure("An unknown error occurred"));
    }
  }
}
