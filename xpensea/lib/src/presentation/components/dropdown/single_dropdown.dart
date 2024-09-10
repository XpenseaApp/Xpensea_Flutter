import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/data/models/expense.dart';

class SimpleDropdownWidget extends StatefulWidget {
  final List<String>? items;
  final String? hint;
  const SimpleDropdownWidget({super.key, this.items, this.hint});

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );

  @override
  State<SimpleDropdownWidget> createState() => _SimpleDropdownWidgetState();
}

class _SimpleDropdownWidgetState extends State<SimpleDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    String? selected;
    final List<String> approvers =
        widget.items ?? ['John Doe', 'Jane Smith', 'Alex Johnson'];
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButtonFormField<String>(
          isExpanded: true,
          decoration: InputDecoration(
            border: SimpleDropdownWidget._border,
            enabledBorder: SimpleDropdownWidget._border,
            focusedBorder: SimpleDropdownWidget._border,
          ),
          value: selected,
          hint: Text(' ${widget.hint}') ?? const Text('Approver'),
          onChanged: (String? newValue) {
            setState(() {
              selected = newValue;
            });

            switch (widget.hint) {
              case 'Approver':
                break;
              case 'Expense Category':
                ref
                    .read(expenseProvider.notifier)
                    .updateExpenseCategory(newValue!);
                break;
              default:
                break;
            }
          },
          items: approvers.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
