import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_system_demo/app/agent/presentation/widgets/build_table.dart';
import 'package:sales_system_demo/app/agent/presentation/widgets/custom_lead_card.dart';
import '../widgets/add_customer.dart';

class AgentDashboard extends ConsumerStatefulWidget {
  const AgentDashboard({super.key});

  @override
  ConsumerState<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends ConsumerState<AgentDashboard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final horizontalPadding = width > 1400 ? 280.0 : 16.0;
    // final verticalPadding = height > 800 ? 100.0 : 16.0;
    return Scaffold(
      appBar: buildAppBar(width, height),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [_overview(), SizedBox(height: 50), BuildTable()],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(double width, double height) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 12.0, top: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(right: 14, left: 14, top: 8),
            ),
            onPressed:
                () =>
                    showDialog(context: context, builder: (_) => AddCustomer()),
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
                CustomLeadCard(
                  title: 'Total Assigned Customers',
                  count: 120,
                  color: Colors.green.withAlpha(100),
                ),
                const SizedBox(width: 77),
                CustomLeadCard(
                  title: 'Hot Leads',
                  count: 25,
                  color: Colors.red.withAlpha(100),
                ),
                const SizedBox(width: 77),
                CustomLeadCard(
                  title: 'Warm Leads',
                  count: 60,
                  color: Colors.orange.withAlpha(90),
                ),
                const SizedBox(width: 77),
                CustomLeadCard(
                  title: 'Not Interested Leads',
                  count: 35,
                  color: Colors.grey.withAlpha(100),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
