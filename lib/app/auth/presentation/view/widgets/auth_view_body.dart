import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/core/theme/app_color.dart';
import 'package:sales_system_demo/app/core/utls/app_styles.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 32),
          child: Text(
            "Hi There, Welcome Back 👋",
            style: AppStyles.textStyle22,
          ),
        ),

        Expanded(
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kSecondary,
                foregroundColor: Colors.white,
                fixedSize: Size(150, 44),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: Text("Login", style: AppStyles.textStyle22),
            ),
          ),
        ),
      ],
    );
  }
}
