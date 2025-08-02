import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart';

class CustomerDialog extends StatelessWidget {
  const CustomerDialog({super.key, required this.customer});
  final CustomerModel customer;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: mediaQuery.width * 0.8,
        height: mediaQuery.height * 0.8,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              customer.fullName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
