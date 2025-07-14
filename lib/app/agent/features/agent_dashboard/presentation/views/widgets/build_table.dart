import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildTable extends ConsumerWidget {
  const BuildTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    final horizontalPadding = width > 1400 ? 280.0 : 16.0;
    // final verticalPadding = height > 800 ? 100.0 : 16.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Header",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF12E57F),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('View all leads'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
