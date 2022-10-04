import 'package:flutter/material.dart';
import 'package:flutter_app/custom/Select.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget {
  DatePicker({
    super.key,
    required this.label,
    this.onPressed,
    this.value,
  });

  final String label;
  final dynamic onPressed;
  final dynamic value;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  dynamic value;

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      widget.onPressed(picked);
      setState(() {
        selectedDate = picked;
        value = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  buildCupertinoDatePicker(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  // ignore: curly_braces_in_flow_control_structures
                  setState(() {
                    selectedDate = picked;
                    value = DateFormat('dd/MM/yyyy').format(selectedDate);
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Select(
      label: widget.label,
      value: widget.value ?? value,
      onPressed: () {
        _selectDate(context);
      },
    );
  }
}
