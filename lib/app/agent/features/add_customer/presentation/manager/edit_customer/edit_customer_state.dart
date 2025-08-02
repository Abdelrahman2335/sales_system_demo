part of 'edit_customer_cubit.dart';

sealed class EditCustomerState extends Equatable {
  const EditCustomerState();

  @override
  List<Object> get props => [];
}

final class EditCustomerInitial extends EditCustomerState {}

final class EditCustomerLoading extends EditCustomerState {}

final class EditCustomerFailure extends EditCustomerState {
  const EditCustomerFailure(this.errMessage);
  final String errMessage;
}

final class EditCustomerSuccess extends EditCustomerState {
  const EditCustomerSuccess(this.customer);
  final CustomerModel customer;
}

final class EditCustomerFormState extends EditCustomerState {
  const EditCustomerFormState(this.customer, this.isValid);
  final CustomerModel customer;
  final bool isValid;
}

