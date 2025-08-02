import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_system_demo/app/agent/features/edit_customer/data/repository/edit_customer_repo.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/cities.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/dummy_constance.dart';
import 'package:sales_system_demo/app/core/utils/debug_logger.dart';

part 'edit_customer_state.dart';

class EditCustomerCubit extends Cubit<EditCustomerState> {
  EditCustomerCubit(
    this.editCustomerRepo, {
    required CustomerModel initialCustomer,
  }) : super(
         EditCustomerFormState(
           customer: initialCustomer, // Initialize with existing customer data
           isFormValid: true, // Start as valid since we have existing data
         ),
       );

  final EditCustomerRepo editCustomerRepo;

  EditCustomerFormState get _currentFormState {
    final currentState = state;
    if (currentState is EditCustomerFormState) {
      return currentState;
    }
    // This shouldn't happen in edit mode, but provide fallback
    return EditCustomerFormState(
      customer: CustomerModel(
        fullName: '',
        phoneNumber: 0,
        city: egyptCities.isNotEmpty ? egyptCities[0] : '',
        region: '',
        interestedProducts: items.isNotEmpty ? [items[0]] : [],
        interestLevel: InterestLevel.warm,
        interactionDateTime: DateTime.now(),
        contactPlatform: contactPlatforms.isNotEmpty ? contactPlatforms[0] : '',
      ),
      isFormValid: false,
    );
  }

  void nameChanged(String name) {
    DebugLogger.log('nameChanged called with: $name', tag: 'EditCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(fullName: name);
    final formState = _currentFormState.copyWith(
      customer: updatedCustomer,
      isFormValid: _validateForm(
        EditCustomerFormState(customer: updatedCustomer),
      ),
    );
    emit(formState);
    DebugLogger.log(
      'emitted new state with name: ${formState.name}',
      tag: 'EditCustomerCubit',
    );
  }

  void phoneChanged(int phone) {
    DebugLogger.log(
      'phoneChanged called with: $phone',
      tag: 'EditCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(
      phoneNumber: phone,
    );
    final formState = _currentFormState.copyWith(
      customer: updatedCustomer,
      isFormValid: _validateForm(
        EditCustomerFormState(customer: updatedCustomer),
      ),
    );
    emit(formState);
    DebugLogger.log(
      'emitted new state with phone: ${formState.phone}',
      tag: 'EditCustomerCubit',
    );
  }

  void regionChanged(String region) {
    DebugLogger.log(
      'regionChanged called with: $region',
      tag: 'EditCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(region: region);
    final formState = _currentFormState.copyWith(
      customer: updatedCustomer,
      isFormValid: _validateForm(
        EditCustomerFormState(customer: updatedCustomer),
      ),
    );
    emit(formState);
    DebugLogger.log(
      'emitted new state with region: ${formState.region}',
      tag: 'EditCustomerCubit',
    );
  }

  void cityChanged(String city) {
    DebugLogger.log('cityChanged called with: $city', tag: 'EditCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(city: city);
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with city: ${formState.selectedCity}',
      tag: 'EditCustomerCubit',
    );
  }

  void itemChanged(String item) {
    DebugLogger.log('itemChanged called with: $item', tag: 'EditCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(
      interestedProducts: [item],
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with item: ${formState.selectedItem}',
      tag: 'EditCustomerCubit',
    );
  }

  void platformChanged(String platform) {
    DebugLogger.log(
      'platformChanged called with: $platform',
      tag: 'EditCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(
      contactPlatform: platform,
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with platform: ${formState.selectedPlatform}',
      tag: 'EditCustomerCubit',
    );
  }

  void interestLevelChanged(InterestLevel interestLevel) {
    DebugLogger.log(
      'interestLevelChanged called with: $interestLevel',
      tag: 'EditCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(
      interestLevel: interestLevel,
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with interest level: ${formState.interestLevel}',
      tag: 'EditCustomerCubit',
    );
  }

  void dateChanged(DateTime date) {
    DebugLogger.log('dateChanged called with: $date', tag: 'EditCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(
      interactionDateTime: date,
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with date: ${formState.selectedDate}',
      tag: 'EditCustomerCubit',
    );
  }

  void submitForm() {
    DebugLogger.log('submitForm called', tag: 'EditCustomerCubit');
    final formState = _currentFormState;

    if (!formState.isFormValid) {
      DebugLogger.logError(
        'Form is not valid, cannot submit',
        context: 'EditCustomerCubit',
      );
      return;
    }

    // Use the existing customer data (including ID) for update
    final customer = formState.customer;

    DebugLogger.log(
      'Updating customer: ${customer.fullName}',
      tag: 'EditCustomerCubit',
    );
    editCustomer(customer: customer);
  }

  bool _validateForm(EditCustomerFormState state) {
    bool isValid =
        state.customer.fullName.isNotEmpty &&
        state.customer.phoneNumber.toString().isNotEmpty &&
        state.customer.region.isNotEmpty;

    return isValid;
  }

  Future<void> editCustomer({required CustomerModel customer}) async {
    emit(EditCustomerLoading());

    var result = await editCustomerRepo.editCustomer(customer);

    result.fold(
      (failure) {
        emit(EditCustomerFailure(failure.errorMessage));
      },
      (value) {
        emit(EditCustomerSuccess());
      },
    );
  }
}
