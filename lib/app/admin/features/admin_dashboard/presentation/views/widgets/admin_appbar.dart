import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/theme/app_color.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';
import 'package:sales_system_demo/app/core/utls/constants.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const Text(Constants.kDashBoardTitle, style: AppStyles.textStyle32),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              backgroundColor: AppColor.kPrimary,
              foregroundColor: Colors.white,
            ),

            onPressed: () {},
            child: const Text("Search for agent", style: AppStyles.textStyle12),
          ),
        ],
      ),
    );
  }
}
