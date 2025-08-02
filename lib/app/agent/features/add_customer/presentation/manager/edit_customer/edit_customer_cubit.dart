import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/core/errors/failure.dart';

part 'edit_customer_state.dart';

class EditCustomerCubit extends Cubit<EditCustomerState> {
  EditCustomerCubit() : super(EditCustomerInitial());
}
