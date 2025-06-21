import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_system_demo/app/data/data_sources/cities.dart';
import 'package:sales_system_demo/app/data/data_sources/products.dart';

import '../constants/ui_strings.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  String selectedCity = egyptCities[0];
  String selectedItem = items[0];
  String selectedPlatform = contactPlatforms[0];
  int? selectedIndex;
  DateTime selectedDate = DateTime.now();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _regionController;
  late TextEditingController _dateController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _regionController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _regionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text("Add Customer"),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFFEEF2F0),
            foregroundColor: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancel"),
        ),
        SizedBox(width: width * 0.5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF12E57F),
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              log("Customer added");
            }
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.2,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 36),
                SizedBox(
                  width: width * 0.2,
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 11) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 36),
                SizedBox(
                  width: width * 0.2,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    items:
                        egyptCities
                            .map(
                              (city) => DropdownMenuItem(
                                value: city,
                                child: FittedBox(child: Text(city)),
                              ),
                            )
                            .toList(),
                    value: selectedCity,
                    onChanged: (Object? value) {
                      selectedCity = value.toString();
                    },
                  ),
                ),

                SizedBox(height: 36),
                SizedBox(
                  width: width * 0.2,
                  child: TextFormField(
                    controller: _regionController,
                    decoration: InputDecoration(
                      labelText: "Region",
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your region';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 36),

                SizedBox(
                  width: width * 0.2,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    items:
                        items
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: FittedBox(child: Text(item)),
                              ),
                            )
                            .toList(),
                    value: selectedItem,
                    onChanged: (Object? value) {
                      selectedItem = value.toString();
                    },
                  ),
                ),
                SizedBox(height: 36),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(3, (index) {
                    final labels = ['Hot Lead', 'Warm', 'Not Interested'];
                    final isSelected = selectedIndex == index;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                            log("$selectedIndex");
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              isSelected
                                  ? [
                                    const Color(0xffff8981),
                                    const Color(0xffffb483),
                                    const Color(0xff4ca66e),
                                  ][index]
                                  : Colors.transparent,
                          foregroundColor:
                              isSelected
                                  ? [
                                    const Color(0xffff392b),
                                    const Color(0xffff7624),
                                    const Color(0xff199e5c),
                                  ][index]
                                  : Colors.grey,
                          side: BorderSide(
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        child: Text(
                          labels[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 36),

                SizedBox(
                  width: width * 0.2,
                  child: GestureDetector(
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
                          _dateController.text = DateFormat.yMMMd().format(
                            selectedDate,
                          );
                        });
                      }
                    },

                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: DateFormat.yMMMd().format(selectedDate),
                          contentPadding: EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                SizedBox(
                  width: width * 0.2,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    items:
                        contactPlatforms
                            .map(
                              (city) => DropdownMenuItem(
                                value: city,
                                child: FittedBox(child: Text(city)),
                              ),
                            )
                            .toList(),
                    value: selectedPlatform,
                    onChanged: (Object? value) {
                      selectedPlatform = value.toString();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}