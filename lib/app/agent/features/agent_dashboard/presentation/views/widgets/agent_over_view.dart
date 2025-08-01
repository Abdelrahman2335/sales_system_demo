import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/manager/agent_dashboard_cubit/agent_dashboard_cubit.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/custom_lead_card.dart';

class AgentOverView extends StatelessWidget {
  const AgentOverView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AgentDashboardCubit>();
    final counts = cubit.getLeadCountsByLevel();

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
                  count: cubit.getTotalCustomerCount(),
                  color: Colors.green.withAlpha(100),
                ),
                const SizedBox(width: 77),
                CustomLeadCard(
                  title: 'Hot Leads',
                  count: counts[InterestLevel.hotLead] ?? 0,
                  color: Colors.red.withAlpha(100),
                ),
                const SizedBox(width: 77),
                CustomLeadCard(
                  title: 'Warm Leads',
                  count: counts[InterestLevel.warm] ?? 0,
                  color: Colors.orange.withAlpha(90),
                ),
                const SizedBox(width: 77),
                CustomLeadCard(
                  title: 'Not Interested Leads',
                  count: counts[InterestLevel.notInterested] ?? 0,
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
