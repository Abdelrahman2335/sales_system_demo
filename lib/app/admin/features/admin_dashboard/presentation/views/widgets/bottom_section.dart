import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class AgentCardBottomSection extends StatelessWidget {
  const AgentCardBottomSection({
    super.key,
    // required this.onHistoryPressed,
    required this.onViewDetailsPressed,
  });
  // final VoidCallback onHistoryPressed;
  final VoidCallback onViewDetailsPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TextButton(
        //   onPressed: onHistoryPressed,
        //   child: Text(
        //     "History",
        //     style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),

        //   ),
        // ),
        TextButton(
          onPressed: onViewDetailsPressed,
          child: Text(
            "View Details",
            style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
