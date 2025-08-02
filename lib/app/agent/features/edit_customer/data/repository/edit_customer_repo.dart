import 'package:dartz/dartz.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/core/errors/failure.dart';

abstract class EditCustomerRepo {
  Future<Either<Failure, void>> editCustomer(CustomerModel customer);
}
