import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.value,
    this.items,
    this.onChanged,
  });

  final String value;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      items: items,
      value: value,
      onChanged: onChanged,
    );
  }
}
