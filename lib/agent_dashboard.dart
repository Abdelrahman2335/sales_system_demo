import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sales_system_demo/widgets/custom_lead_card.dart';

import 'dummy_data.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          children: [_overview(), SizedBox(height: 50), _buildLeadCard()],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 12.0, top: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(right: 14, left: 14, top: 8),
            ),
            onPressed: () {},
            child: Text("Add new customer"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 12.0, top: 8),
          child: CircleAvatar(radius: 21, child: Icon(Icons.person)),
        ),
      ],
    );
  }

  Widget _overview() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SizedBox(
            height: 180,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                buildLeadCard(
                  title: 'Total Assigned Customers',
                  count: '120',
                  color: Colors.green.withAlpha(100),
                ),
                const SizedBox(width: 77),
                buildLeadCard(
                  title: 'Hot Leads',
                  count: '25',
                  color: Colors.red.withAlpha(100),
                ),
                const SizedBox(width: 77),
                buildLeadCard(
                  title: 'Warm Leads',
                  count: '60',
                  color: Colors.orange.withAlpha(90),
                ),
                const SizedBox(width: 77),
                buildLeadCard(
                  title: 'Not Interested Leads',
                  count: '35',
                  color: Colors.grey.withAlpha(100),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeadCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Leads",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Phone")),
            DataColumn(label: Text("City")),
            DataColumn(label: Text("Region")),
            DataColumn(label: Text("Products Interested")),
            DataColumn(label: Text("Interest Level")),
            DataColumn(label: Text("Interaction Date")),
            DataColumn(label: Text("Contact Platform")),
          ],
          rows: List.generate(dummyCustomers.length, (index) {
            final customer = dummyCustomers[index];
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
                DataCell(Text(customer.interestLevel.name)),
                DataCell(Text(customer.interactionDateTime.toString())),
                DataCell(Text(customer.contactPlatform)),
              ],
            );
          }),
        ),
      ],
    );
  }
}
