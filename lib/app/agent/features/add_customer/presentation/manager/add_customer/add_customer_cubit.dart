import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/repository/add_customer_repo.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit(this.addCustomerRepo) : super(AddCustomerInitial());

  final AddCustomerRepo addCustomerRepo;

  Future<void> addCustomer({required CustomerModel customer}) async {
    emit(AddCustomerLoading());

    var result = await addCustomerRepo.addCustomer(customer);

    result.fold(
      (failure) {
        emit(AddCustomerFailure(failure.errorMessage));
      },
      (value) {
        emit(AddCustomerSuccess());
      },
    );
  }
}
