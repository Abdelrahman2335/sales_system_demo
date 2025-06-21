import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/dummy_data.dart';
import '../../data/models/customer_model.dart';

class TableViewModel extends Notifier<List<Customer>> {
  @override
  List<Customer> build() {
    return dummyData;
  }

  void selectLead(Customer customer) {
    // Add selection logic, filtering, etc.
    log('Selected: ${customer.fullName}');
  }

  void updateInterestLevel(Customer updatedCustomer, InterestLevel newLevel) {

      for (var customer in state) {
        if (customer.id == updatedCustomer.id) {
          customer.interestLevel = newLevel;
        } else {
          customer;
        }
      }

  }

}

final tableProvider = NotifierProvider<TableViewModel, List<Customer>>(
  () => TableViewModel(),
);
