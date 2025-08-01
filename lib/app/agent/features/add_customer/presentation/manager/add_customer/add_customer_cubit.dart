import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/repository/add_customer_repo.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/cities.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/dummy_constance.dart';
import 'package:sales_system_demo/app/core/utils/debug_logger.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit(this.addCustomerRepo)
    : super(
        AddCustomerFormState(
          customer: CustomerModel(
            fullName: '',
            phoneNumber: '',
            city: egyptCities.isNotEmpty ? egyptCities[0] : '',
            region: '',
            interestedProducts: items.isNotEmpty ? [items[0]] : [],
            interestLevel: InterestLevel.warm,
            interactionDateTime: DateTime.now(),
            contactPlatform:
                contactPlatforms.isNotEmpty ? contactPlatforms[0] : '',
          ),
          isFormValid: false,
        ),
      );

  final AddCustomerRepo addCustomerRepo;

  AddCustomerFormState get _currentFormState {
    final currentState = state;
    if (currentState is AddCustomerFormState) {
      return currentState;
    }
    return AddCustomerFormState(
      customer: CustomerModel(
        fullName: '',
        phoneNumber: '',
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
    DebugLogger.log('nameChanged called with: $name', tag: 'AddCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(fullName: name);
    final formState = _currentFormState.copyWith(
      customer: updatedCustomer,
      isFormValid: _validateForm(
        AddCustomerFormState(customer: updatedCustomer),
      ),
    );
    emit(formState);
    DebugLogger.log(
      'emitted new state with name: ${formState.name}',
      tag: 'AddCustomerCubit',
    );
  }

  void phoneChanged(String phone) {
    DebugLogger.log(
      'phoneChanged called with: $phone',
      tag: 'AddCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(
      phoneNumber: phone,
    );
    final formState = _currentFormState.copyWith(
      customer: updatedCustomer,
      isFormValid: _validateForm(
        AddCustomerFormState(customer: updatedCustomer),
      ),
    );
    emit(formState);
    DebugLogger.log(
      'emitted new state with phone: ${formState.phone}',
      tag: 'AddCustomerCubit',
    );
  }

  void regionChanged(String region) {
    DebugLogger.log(
      'regionChanged called with: $region',
      tag: 'AddCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(region: region);
    final formState = _currentFormState.copyWith(
      customer: updatedCustomer,
      isFormValid: _validateForm(
        AddCustomerFormState(customer: updatedCustomer),
      ),
    );
    emit(formState);
    DebugLogger.log(
      'emitted new state with region: ${formState.region}',
      tag: 'AddCustomerCubit',
    );
  }

  void cityChanged(String city) {
    DebugLogger.log('cityChanged called with: $city', tag: 'AddCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(city: city);
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with city: ${formState.selectedCity}',
      tag: 'AddCustomerCubit',
    );
  }

  void itemChanged(String item) {
    DebugLogger.log('itemChanged called with: $item', tag: 'AddCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(
      interestedProducts: [item],
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with item: ${formState.selectedItem}',
      tag: 'AddCustomerCubit',
    );
  }

  void platformChanged(String platform) {
    DebugLogger.log(
      'platformChanged called with: $platform',
      tag: 'AddCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(
      contactPlatform: platform,
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with platform: ${formState.selectedPlatform}',
      tag: 'AddCustomerCubit',
    );
  }

  void interestLevelChanged(InterestLevel interestLevel) {
    DebugLogger.log(
      'interestLevelChanged called with: $interestLevel',
      tag: 'AddCustomerCubit',
    );
    final updatedCustomer = _currentFormState.customer.copyWith(
      interestLevel: interestLevel,
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with interest level: ${formState.interestLevel}',
      tag: 'AddCustomerCubit',
    );
  }

  void dateChanged(DateTime date) {
    DebugLogger.log('dateChanged called with: $date', tag: 'AddCustomerCubit');
    final updatedCustomer = _currentFormState.customer.copyWith(
      interactionDateTime: date,
    );
    final formState = _currentFormState.copyWith(customer: updatedCustomer);
    emit(formState);
    DebugLogger.log(
      'emitted new state with date: ${formState.selectedDate}',
      tag: 'AddCustomerCubit',
    );
  }

  void submitForm() {
    DebugLogger.log('submitForm called', tag: 'AddCustomerCubit');
    final formState = _currentFormState;

    if (!formState.isFormValid) {
      DebugLogger.logError(
        'Form is not valid, cannot submit',
        context: 'AddCustomerCubit',
      );
      return;
    }

    // Create final customer model with any missing fields filled
    final customer = CustomerModel(
      fullName: formState.customer.fullName,
      phoneNumber: formState.customer.phoneNumber,
      city: formState.customer.city,
      region: formState.customer.region,
      interestedProducts: formState.customer.interestedProducts,
      interestLevel: formState.customer.interestLevel,
      interactionDateTime: formState.customer.interactionDateTime,
      contactPlatform: formState.customer.contactPlatform,
    );

    DebugLogger.log(
      'Submitting customer: ${customer.fullName}',
      tag: 'AddCustomerCubit',
    );
    addCustomer(customer: customer);
  }

  bool _validateForm(AddCustomerFormState state) {
    return state.customer.fullName.isNotEmpty &&
        state.customer.phoneNumber.isNotEmpty &&
        state.customer.region.isNotEmpty;
  }

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