
part of 'add_customer_cubit.dart';

@immutable
sealed class AddCustomerState {}

final class AddCustomerInitial extends AddCustomerState {}

final class AddCustomerLoading extends AddCustomerState {}

final class AddCustomerSuccess extends AddCustomerState {}

final class AddCustomerFailure extends AddCustomerState {
  AddCustomerFailure(this.errMessage);
  final String errMessage;
}

final class AddCustomerFormState extends AddCustomerState {
  final CustomerModel customer;
  final bool isFormValid;

  AddCustomerFormState({required this.customer, this.isFormValid = false});

  AddCustomerFormState copyWith({CustomerModel? customer, bool? isFormValid}) {
    return AddCustomerFormState(
      customer: customer ?? this.customer,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  // Helper getters for easy access (optional - keeps existing UI code working)
  String get name => customer.fullName;
  String get phone => customer.phoneNumber;
  String get region => customer.region;
  String get selectedCity => customer.city;
  List<String> get interestedProducts => customer.interestedProducts;
  String get selectedItem =>
      interestedProducts.isNotEmpty ? interestedProducts[0] : '';
  String get selectedPlatform => customer.contactPlatform;
  InterestLevel get interestLevel => customer.interestLevel;
  DateTime get selectedDate => customer.interactionDateTime;
}
