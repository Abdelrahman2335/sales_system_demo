import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/cities.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/dummy_constance.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/manager/add_customer/add_customer_cubit.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/custom_form_field.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/interest_level.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/manager/agent_dashboard_cubit/agent_dashboard_cubit.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<AddCustomerCubit, AddCustomerState>(
      listener: (context, state) {
        if (state is AddCustomerSuccess) {
          context.read<AgentDashboardCubit>().fetchCustomerList();
          GoRouter.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Customer added successfully!')),
          );
        } else if (state is AddCustomerFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is AddCustomerLoading) {
          return Center(child: CircularProgressIndicator());
        }

        final formState =
            state is AddCustomerFormState
                ? state
                : AddCustomerFormState(
                  // selectedDate:
                  customer: CustomerModel(
                    fullName: "",
                    phoneNumber: "",
                    city: egyptCities.isNotEmpty ? egyptCities[0] : '',
                    region: "",
                    interestedProducts: items.isNotEmpty ? items : [],
                    interestLevel: InterestLevel.hotLead,
                    interactionDateTime: DateTime.now(),
                    contactPlatform:
                        contactPlatforms.isNotEmpty ? contactPlatforms[0] : '',
                  ),
                );

        return AlertDialog(
          title: const Text("Add Customer"),
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
                      ? () => context.read<AddCustomerCubit>().submitForm()
                      : null,
              child: Text("Add Customer"),
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
                                .read<AddCustomerCubit>()
                                .nameChanged(value),
                      ),
                      CustomFormField(
                        labelText: "Phone",
                        initialValue: formState.phone,
                        onChanged:
                            (value) => context
                                .read<AddCustomerCubit>()
                                .phoneChanged(value),
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
                                .read<AddCustomerCubit>()
                                .cityChanged(value!),
                      ),
                      CustomFormField(
                        labelText: "Region",
                        initialValue: formState.region,
                        onChanged:
                            (value) => context
                                .read<AddCustomerCubit>()
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
                                .read<AddCustomerCubit>()
                                .itemChanged(value!),
                      ),
                      InterestLevelTape(
                        selectedLevel: formState.interestLevel,
                        onChanged:
                            (level) => context
                                .read<AddCustomerCubit>()
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
                              context.read<AddCustomerCubit>().dateChanged(
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
                                .read<AddCustomerCubit>()
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
