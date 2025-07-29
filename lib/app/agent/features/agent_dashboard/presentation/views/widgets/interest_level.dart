import 'package:flutter/material.dart';

class InterestLevel extends StatefulWidget {
  const InterestLevel({super.key});

  @override
  State<InterestLevel> createState() => _InterestLevelState();
}

class _InterestLevelState extends State<InterestLevel> {
  @override
  Widget build(BuildContext context) {
    int? selectedIndex;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        final labels = ['Hot Lead', 'Warm', 'Not Interested'];
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            style: OutlinedButton.styleFrom(
              backgroundColor:
                  isSelected
                      ? [
                        const Color(0xffff8981),
                        const Color(0xffffb483),
                        const Color(0xff4ca66e),
                      ][index]
                      : Colors.transparent,
              foregroundColor:
                  isSelected
                      ? [
                        const Color(0xffff392b),
                        const Color(0xffff7624),
                        const Color(0xff199e5c),
                      ][index]
                      : Colors.grey,
              side: BorderSide(color: isSelected ? Colors.white : Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: Text(labels[index], style: TextStyle(color: Colors.black)),
          ),
        );
      }),
    );
  }
}
