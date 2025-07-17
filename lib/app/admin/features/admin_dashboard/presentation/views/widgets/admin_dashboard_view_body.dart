import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/admin_appbar.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/custom_agent_card.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/overall_performance.dart';

class AdminDashBoardViewBody extends StatelessWidget {
  const AdminDashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56, right: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdminAppBar(),

          const OverallPerformance(),

          const SizedBox(height: 25),

          const SizedBox(height: 44),
          Center(
            child: Wrap(
              spacing: 40,
              runSpacing: 30,
              children: const [
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
                CustomAgentCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
