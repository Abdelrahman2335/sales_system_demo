import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/cities.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/dummy_constance.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/custom_form_field.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/interest_level.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  String selectedCity = egyptCities[0];
  String selectedItem = items[0];
  String selectedPlatform = contactPlatforms[0];

  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
          },
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
                  const CustomFormField(labelText: "Name"),
                  const CustomFormField(labelText: "Phone"),
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
                    value: selectedCity,
                  ),

                  const CustomFormField(labelText: "Region"),

                  CustomDropdownButton(
                    value: selectedItem,
                    items:
                        items
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                  ),
                  const InterestLevel(),
                  GestureDetector(
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: CustomFormField(
                        labelText: DateFormat.yMMMd().format(selectedDate),
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
                    value: selectedPlatform,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
