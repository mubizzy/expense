

import 'package:flutter/material.dart';

Widget customButton(
    String text,
     void Function()? onTap,
) {
  return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey), // Background color
                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                padding: MaterialStateProperty.all<EdgeInsets>(
                 const EdgeInsets.all(4.0)), // Padding
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.0)), // Border radius
                ),
              ),
              onPressed: onTap,
              child:  Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
}