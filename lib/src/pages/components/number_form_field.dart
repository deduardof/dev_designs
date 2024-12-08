import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends StatefulWidget {
  const NumberFormField({super.key, required this.controller, this.edit = true});
  final TextEditingController controller;
  final bool edit;

  @override
  State<NumberFormField> createState() => _NumberFormFieldState();
}

class _NumberFormFieldState extends State<NumberFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      readOnly: !widget.edit,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF808080),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            final num = int.tryParse(widget.controller.text) ?? 0;
            if (num > 0) {
              widget.controller.text = (num - 1).toString();
            }
          },
          icon: const Icon(Icons.remove),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            final num = int.tryParse(widget.controller.text) ?? 0;
            widget.controller.text = (num + 1).toString();
          },
          icon: const Icon(Icons.add),
        ),
      ),
      onChanged: (value) {
        final num = int.tryParse(value) ?? 0;
        if (num < 0) {
          widget.controller.text = '0';
        }
      },
    );
  }
}
