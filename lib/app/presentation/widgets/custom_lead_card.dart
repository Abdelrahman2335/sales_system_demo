import 'package:flutter/material.dart';

Widget buildLeadCard({
  required String title,
  required String count,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.only(left: 16, top: 21, right: 16),
    height: 130,
    width: 250,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.withAlpha(140)),
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
      ],
    ),
  );
}
