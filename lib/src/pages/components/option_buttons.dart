import 'package:flutter/material.dart';

enum PeriodTypes {
  daily(name: 'Diariamente'),
  weekly(name: 'Semanalmente'),
  monthly(name: 'Mensalmente'),
  yearly(name: 'Anualmente');

  const PeriodTypes({required this.name});

  final String name;
}

class OptionButtons extends StatefulWidget {
  const OptionButtons({super.key, required this.buttons});
  final List<OptionButton> buttons;

  @override
  State<OptionButtons> createState() => _OptionButtonsState();
}

class _OptionButtonsState extends State<OptionButtons> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.buttons,
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.selected,
    required this.label,
    required this.onTap,
    this.selectedColor = const Color(0xFFFAFAFA),
    this.unselectedColor = Colors.transparent,
  });
  final bool selected;
  final String label;
  final void Function() onTap;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (selected) ? selectedColor : unselectedColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontWeight: (selected) ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
