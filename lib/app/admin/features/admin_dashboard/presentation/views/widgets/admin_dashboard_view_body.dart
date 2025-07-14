import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/admin_dashboard/presentation/views/widgets/admin_appbar.dart';

class AdminDashBoardViewBody extends StatelessWidget {
  const AdminDashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     const   AdminAppBar(),
      ],
    );
  }
}
