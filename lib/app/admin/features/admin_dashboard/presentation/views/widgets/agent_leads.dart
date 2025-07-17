
import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class AgentLeads extends StatelessWidget {
  const AgentLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text("Hot Leads", style: AppStyles.textStyle12),
            SizedBox(height: 4),
            Text("30", style: AppStyles.textStyle16),
          ],
        ),
        Column(
          children: [
            Text("Warm Leads", style: AppStyles.textStyle12),
            SizedBox(height: 4),
            Text("30", style: AppStyles.textStyle16),
          ],
        ),
        Column(
          children: [
            Text("Cold Leads", style: AppStyles.textStyle12),
            SizedBox(height: 4),
            Text("30", style: AppStyles.textStyle16),
          ],
        ),
      ],
    );
  }
}
