part of 'edit_customer_cubit.dart';

@immutable
sealed class EditCustomerState {}

final class EditCustomerInitial extends EditCustomerState {}

final class EditCustomerLoading extends EditCustomerState {}

final class EditCustomerSuccess extends EditCustomerState {}

final class EditCustomerFailure extends EditCustomerState {
  EditCustomerFailure(this.errMessage);
  final String errMessage;
}

final class EditCustomerFormState extends EditCustomerState {
  final CustomerModel customer;
  final bool isFormValid;

  EditCustomerFormState({required this.customer, this.isFormValid = false});

  EditCustomerFormState copyWith({CustomerModel? customer, bool? isFormValid}) {
    return EditCustomerFormState(
      customer: customer ?? this.customer,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  // Helper getters for easy access (optional - keeps existing UI code working)
  String get name => customer.fullName;
  int get phone => customer.phoneNumber;
  String get region => customer.region;
  String get selectedCity => customer.city;
  List<String> get interestedProducts => customer.interestedProducts;
  String get selectedItem =>
      interestedProducts.isNotEmpty ? interestedProducts[0] : '';
  String get selectedPlatform => customer.contactPlatform;
  InterestLevel get interestLevel => customer.interestLevel;
  DateTime get selectedDate => customer.interactionDateTime;
}
