import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/data/models/customer_model.dart'
    as model;

class InterestLevelTape extends StatefulWidget {
  const InterestLevelTape({super.key, this.onChanged, this.selectedLevel});

  final Function(model.InterestLevel)? onChanged;
  final model.InterestLevel? selectedLevel;

  @override
  State<InterestLevelTape> createState() => _InterestLevelTapeState();
}

class _InterestLevelTapeState extends State<InterestLevelTape> {
  model.InterestLevel? selectedLevel;

  @override
  void initState() {
    super.initState();
    selectedLevel = widget.selectedLevel ?? model.InterestLevel.notInterested;
  }

  @override
  Widget build(BuildContext context) {
    final levels = [
      model.InterestLevel.hotLead,
      model.InterestLevel.warm,
      model.InterestLevel.notInterested,
    ];
    final labels = ['Hot Lead', 'Warm', 'Not Interested'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        final isSelected = selectedLevel == levels[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedLevel = levels[index];
              });
              widget.onChanged?.call(levels[index]);
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
