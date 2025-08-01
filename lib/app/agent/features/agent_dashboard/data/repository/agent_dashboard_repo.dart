import 'package:dartz/dartz.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/core/errors/failure.dart';

abstract class AgentDashboardRepo {
  Future<Either<Failure, List<CustomerModel>>> fetchCustomerList({
    required String agentId,
  });
}
