import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/data_sources/dummy_data.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/customer_dialog.dart';

class BuildTable extends StatelessWidget {
  const BuildTable({super.key});

  @override
  Widget build(BuildContext context) {
    const leadTableColumns = [
      "Name",
      "Phone",
      "City",
      "Region",
      "Interested Products",
      "Interest Level",
      "Interaction Date",
      "Contact Platform",
    ];
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    final horizontalPadding = width > 1400 ? 280.0 : 16.0;
    // final verticalPadding = height > 800 ? 100.0 : 16.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Header",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF12E57F),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('View all leads'),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            showCheckboxColumn: false,
            columns: List.generate(leadTableColumns.length, (columnIndex) {
              return DataColumn(label: Text(leadTableColumns[columnIndex]));
            }),
            rows: List.generate(12, (index) {
              final List<CustomerModel> source = dummyData.take(12).toList();
              final customer = source[index];

              return DataRow(
                onSelectChanged: (value) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomerDialog();
                    },
                  );
                },

                cells: [
                  DataCell(Text(customer.fullName)),
                  DataCell(Text(customer.phoneNumber)),
                  DataCell(Text(customer.city)),
                  DataCell(Text(customer.region)),
                  DataCell(
                    Text(
                      customer.interestedProducts.join(', '),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(Text(customer.interestLevel.label)),
                  DataCell(Text(customer.interactionDateTime.toString())),
                  DataCell(Text(customer.contactPlatform)),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
