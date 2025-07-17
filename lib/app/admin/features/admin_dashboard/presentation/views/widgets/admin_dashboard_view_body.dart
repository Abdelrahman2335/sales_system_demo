import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/admin_appbar.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/custom_agent_card.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/custom_status_card.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';
import 'package:sales_system_demo/app/core/utls/constants.dart';

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

          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: const Row(
                children: [
                  CustomStatusCard(title: "Total Leads", value: 12000),
                  CustomStatusCard(
                    title: "Hot Leads",
                    value: 1200,
                    ishotlead: true,
                  ),
                  CustomStatusCard(title: "Warm Leads", value: 9000),
                  CustomStatusCard(title: "Cold Leads", value: 2000),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),
          Text(
            "Agents",
            style: AppStyles.textStyle18.copyWith(
              fontFamily: Constants.kRaleway,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 44),
          const CustomAgentCard(),
        ],
      ),
    );
  }
}
