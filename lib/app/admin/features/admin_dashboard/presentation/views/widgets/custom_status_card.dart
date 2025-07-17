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
      padding: const EdgeInsets.only(top: 58, right: 30),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300, minHeight: 150),
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),

        child: AspectRatio(
          aspectRatio: 210 / 110,

          child: Padding(
            padding: const EdgeInsets.only(left: 24, top: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.textStyle16),
                  const SizedBox(height: 5),
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
        ),
      ),
    );
  }
}
