import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/auth/presentation/view/widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthViewBody());
  }
}
