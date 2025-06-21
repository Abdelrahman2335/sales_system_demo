import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/customer_model.dart';
import '../constants/ui_strings.dart';
import '../viewModel/table_view_model.dart';

class BuildTable extends ConsumerWidget {
  const BuildTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    final horizontalPadding = width > 1400 ? 280.0 : 16.0;
    // final verticalPadding = height > 800 ? 100.0 : 16.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: horizontalPadding,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                header,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF12E57F),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'View all leads',
                ),
              ),

            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: List.generate(leadTableColumns.length, (columnIndex) {
              return DataColumn(label: Text(leadTableColumns[columnIndex]));
            }),
            rows: List.generate(12, (index) {
              final List<Customer> source =
              ref.watch(tableProvider).take(12).toList();
              final customer = source[index];

              return DataRow(
                onSelectChanged: (value) {
                  log(customer.fullName);
                },
                cells: [
                  DataCell(Text(customer.fullName)),
                  DataCell(Text(customer.phoneNumber)),
                  DataCell(Text(customer.city)),
                  DataCell(Text(customer.region)),
                  DataCell(Text(customer.productsInterested.join(', '))),
                  DataCell(Text(customer.interestLevel.label)),
                  DataCell(Text(customer.interactionDateTime.toString())),
                  DataCell(Text(customer.contactPlatform),),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
