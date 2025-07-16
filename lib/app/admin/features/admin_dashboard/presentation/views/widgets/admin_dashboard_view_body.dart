import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/admin_appbar.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/custom_status_card.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class AdminDashBoardViewBody extends StatelessWidget {
  const AdminDashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdminAppBar(),
          Text(
            "Quick Stats",
            style: AppStyles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),

          const Row(
            children: [
              CustomStatusCard(title: "Total Leads", value: 20000),
              CustomStatusCard(
                title: "Hot Leads",
                value: 1200,
                ishotlead: true,
              ),
              CustomStatusCard(title: "Warm Leads", value: 9000),
              CustomStatusCard(title: "Cold Leads", value: 11000),
            ],
          ),
        ],
      ),
    );
  }
}
