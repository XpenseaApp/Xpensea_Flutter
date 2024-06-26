import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';

class SimpleDropdownWidget extends StatefulWidget {
  const SimpleDropdownWidget({super.key});

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0), // Rounded corners
    borderSide:
        const BorderSide(color: AppPalette.kGray4, width: 1), // No border
  );

  @override
  State<SimpleDropdownWidget> createState() => _SimpleDropdownWidgetState();
}

class _SimpleDropdownWidgetState extends State<SimpleDropdownWidget> {
  String? _selectedApprover;
  final List<String> _approvers = ['John Doe', 'Jane Smith', 'Alex Johnson'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        border: SimpleDropdownWidget._border,
        enabledBorder: SimpleDropdownWidget._border,
        focusedBorder: SimpleDropdownWidget._border,
      ),
      value: _selectedApprover,
      hint: const Text('Approver'),
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
