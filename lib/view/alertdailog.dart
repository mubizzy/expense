import 'package:demo_ville/view/customTextButton.dart';
import 'package:demo_ville/widget/expense_form.dart';
import 'package:flutter/material.dart';

void addReceiptDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content:const ExpenseForm(),
          actions: [
           customButton('Save', () { Navigator.pop(context);}),
          customButton('Keep It', () { Navigator.pop(context);}),
          customButton('Yes Delete', () { Navigator.pop(context);})
          ],
        );
      });
}

void filterDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          icon: const Icon(Icons.delete),
          //NOTE: Replace the content below to the class you create to handle this
          content: const Text(
            'Input your receipt for tracking',
            style: TextStyle(
              fontSize: 7,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
          customButton('Save', () { Navigator.pop(context);}),
          customButton('Keep It', () { Navigator.pop(context);}),
          customButton('Yes Delete', () { Navigator.pop(context);})

          ],
        );
      });
}

void infoDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: const SizedBox(
            height: 80,
            child: Column(
              children: [
                Text(
                  'Welcome to Expense Manager ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'This is a sample mobile app to track your expenses ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey), // Background color
                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(16.0)), // Padding
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.0)), // Border radius
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Got it',
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      });
}
