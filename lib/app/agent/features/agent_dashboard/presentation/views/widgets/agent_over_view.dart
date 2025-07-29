
import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/custom_lead_card.dart';

class AgentOverView extends StatelessWidget {
  const AgentOverView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
