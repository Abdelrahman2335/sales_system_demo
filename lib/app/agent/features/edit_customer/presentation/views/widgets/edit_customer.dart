import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/cities.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/dummy_constance.dart';
import 'package:sales_system_demo/app/agent/features/edit_customer/presentation/manager/edit_customer/edit_customer_cubit.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/custom_form_field.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/interest_level.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/manager/agent_dashboard_cubit/agent_dashboard_cubit.dart';
import 'package:sales_system_demo/app/core/utils/debug_logger.dart';

class EditCustomer extends StatefulWidget {
  final CustomerModel customer;

  const EditCustomer({super.key, required this.customer});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<EditCustomerCubit, EditCustomerState>(
      listener: (context, state) {
        if (state is EditCustomerSuccess) {
          context.read<AgentDashboardCubit>().fetchCustomerList();
          GoRouter.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Customer updated successfully!')),
          );
        } else if (state is EditCustomerFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        DebugLogger.log("Edit customer state: $state");
        if (state is EditCustomerLoading) {
          return Center(child: CircularProgressIndicator());
        }

        final formState =
            state is EditCustomerFormState
                ? state
                : EditCustomerFormState(
                  customer: widget.customer, // Use the passed customer data
                );

        return AlertDialog(
          title: const Text("Edit Customer"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFEEF2F0),
                foregroundColor: Colors.black,
              ),
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text("Cancel"),
            ),
            SizedBox(width: width * 0.5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF12E57F),
                foregroundColor: Colors.black,
              ),
              onPressed:
                  formState.isFormValid
                      ? () => context.read<EditCustomerCubit>().submitForm()
                      : null,
              child: Text("Update Customer"),
            ),
          ],
          content: SizedBox(
            width: width * 0.5,
            child: Form(
              key: _formKey,
              canPop: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.08,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 36,
                    children: [
                      CustomFormField(
                        labelText: "Name",
                        initialValue: formState.name,
                        onChanged:
                            (value) => context
                                .read<EditCustomerCubit>()
                                .nameChanged(value),
                      ),
                      CustomFormField(
                        labelText: "Phone",
                        initialValue: formState.phone.toString(),
                        onChanged:
                            (value) => context
                                .read<EditCustomerCubit>()
                                .phoneChanged(int.parse(value)),
                      ),
                      CustomDropdownButton(
                        items:
                            egyptCities
                                .map(
                                  (city) => DropdownMenuItem(
                                    value: city,
                                    child: Text(city),
                                  ),
                                )
                                .toList(),
                        value: formState.selectedCity,
                        onChanged:
                            (value) => context
                                .read<EditCustomerCubit>()
                                .cityChanged(value!),
                      ),
                      CustomFormField(
                        labelText: "Region",
                        initialValue: formState.region,
                        onChanged:
                            (value) => context
                                .read<EditCustomerCubit>()
                                .regionChanged(value),
                      ),
                      CustomDropdownButton(
                        value: formState.selectedItem,
                        items:
                            items
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  ),
                                )
                                .toList(),
                        onChanged:
                            (value) => context
                                .read<EditCustomerCubit>()
                                .itemChanged(value!),
                      ),
                      InterestLevelTape(
                        selectedLevel: formState.interestLevel,
                        onChanged:
                            (level) => context
                                .read<EditCustomerCubit>()
                                .interestLevelChanged(level),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: formState.selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            if (mounted) {
                              context.read<EditCustomerCubit>().dateChanged(
                                pickedDate,
                              );
                            }
                          }
                        },
                        child: AbsorbPointer(
                          child: CustomFormField(
                            labelText: DateFormat.yMMMd().format(
                              formState.selectedDate,
                            ),
                            suffixIcon: const Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      CustomDropdownButton(
                        items:
                            contactPlatforms
                                .map(
                                  (platform) => DropdownMenuItem(
                                    value: platform,
                                    child: Text(platform),
                                  ),
                                )
                                .toList(),
                        value: formState.selectedPlatform,
                        onChanged:
                            (value) => context
                                .read<EditCustomerCubit>()
                                .platformChanged(value!),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
