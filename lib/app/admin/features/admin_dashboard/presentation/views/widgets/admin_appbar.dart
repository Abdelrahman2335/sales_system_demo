import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales_system_demo/app/core/theme/app_color.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';
import 'package:sales_system_demo/app/core/utls/constants.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 20),
      child: Row(
        children: [
          const Text(Constants.kDashBoardTitle, style: AppStyles.textStyle40),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kPrimary,
              foregroundColor: Colors.white,
            ),

            onPressed: () {},
            label: const Text("Search for agent", style: AppStyles.textStyle12),
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}
