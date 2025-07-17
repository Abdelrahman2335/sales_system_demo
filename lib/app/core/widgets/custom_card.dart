import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/theme/app_color.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    return  Container(
      height: 150,
      width: 240,
      decoration: BoxDecoration(
        color: AppColor.kSecondry,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding:  EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Leads", style: AppStyles.textStyle22),
            Text("200", style: AppStyles.textStyle40),
          ],
        ),
      ),
    );
  }
}
