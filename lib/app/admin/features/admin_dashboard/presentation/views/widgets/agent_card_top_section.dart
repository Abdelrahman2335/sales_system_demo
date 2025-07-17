
import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class AgentCardTopSection extends StatelessWidget {
  const AgentCardTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Agent 1",
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Title", style: AppStyles.textStyle12),
            const SizedBox(height: 4),

            const Text("Sales agent", style: AppStyles.textStyle16),
          ],
        ),
        const Spacer(),
        const Column(
          children: [
            Text("Total Leads", style: AppStyles.textStyle18),
            Text("150", style: AppStyles.textStyle22),
          ],
        ),
      ],
    );
  }
}