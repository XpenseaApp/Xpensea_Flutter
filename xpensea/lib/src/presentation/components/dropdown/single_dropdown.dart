import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';

class SimpleDropdownWidget extends StatefulWidget {
  final List<String>? items;
  final String? hint;
  SimpleDropdownWidget({super.key, this.items, this.hint});

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
    String? _selectedApprover;
    final List<String> _approvers =
        widget.items ?? ['John Doe', 'Jane Smith', 'Alex Johnson'];
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        border: SimpleDropdownWidget._border,
        enabledBorder: SimpleDropdownWidget._border,
        focusedBorder: SimpleDropdownWidget._border,
      ),
      value: _selectedApprover,
      hint: Text(' ${widget.hint}') ?? Text('Approver'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedApprover = newValue;
        });
      },
      items: _approvers.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
