import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/admin_appbar.dart';
import 'package:sales_system_demo/app/core/widgets/custom_card.dart';

class AdminDashBoardViewBody extends StatelessWidget {
  const AdminDashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AdminAppBar(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomCard(),

            const CustomCard(),
            const CustomCard(),
          ],
        ),
        // Add more widgets here as needed
      ],
    );
  }
}
