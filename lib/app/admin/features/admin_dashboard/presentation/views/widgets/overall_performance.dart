import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/custom_status_card.dart';

class OverallPerformance extends StatelessWidget {
  const OverallPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: const Row(
          children: [
            CustomStatusCard(title: "Total Leads", value: 12000),
            CustomStatusCard(title: "Hot Leads", value: 1200, ishotlead: true),
            CustomStatusCard(title: "Warm Leads", value: 9000),
            CustomStatusCard(title: "Cold Leads", value: 2000),
          ],
        ),
      ),
    );
  }
}
