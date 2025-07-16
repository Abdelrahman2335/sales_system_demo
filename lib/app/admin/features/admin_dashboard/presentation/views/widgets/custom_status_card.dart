import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class CustomStatusCard extends StatelessWidget {
  const CustomStatusCard({
    super.key,
    required this.title,
    required this.value,
    this.ishotlead = false,
  });
  final String title;
  final int value;
  final bool ishotlead;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58, left: 27),
      child: Container(
        height: 130,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.textStyle14),
              Text(
                "$value",
                style:
                    ishotlead
                        ? AppStyles.textStyle32.copyWith(
                          color: Color(0xffF35162),
                        )
                        : AppStyles.textStyle32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
