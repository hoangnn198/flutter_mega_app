// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  const Select({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.value,
    this.width,
    this.sizeIcon,
    this.colorIcon,
  });

  final String? label;
  final dynamic icon;
  final dynamic onPressed;
  final dynamic value;
  final dynamic sizeIcon;
  final dynamic colorIcon;
  final width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            // backgroundColor: Colors.white,// background
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.grey), // foreground border
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            )),
        onPressed: () {
          onPressed != null ? onPressed() : null;
        },
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              // ignore: prefer_if_null_operators, unnecessary_null_comparison
              value != null ? '$value' : '$label',
              style: TextStyle(
                  fontSize: 15,
                  color: value != null ? Colors.black : Colors.grey[600]),
            ),
            Icon(
              icon ?? Icons.keyboard_arrow_down_outlined,
              size: sizeIcon ?? 20,
              color: colorIcon ?? Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
