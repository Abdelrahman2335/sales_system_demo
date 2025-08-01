import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.initialValue,
  });

  final TextEditingController? controller;
  final String labelText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? initialValue;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late TextEditingController _controller;
  bool _isInternalController = false;

  @override
  void initState() {
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue ?? '');
      _isInternalController = true;
    } else {
      _controller = widget.controller!;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_isInternalController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.2,
      child: TextFormField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
      ),
    );
  }
}
