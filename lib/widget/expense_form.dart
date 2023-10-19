import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  ExpenseFormState createState() => ExpenseFormState();
}

class ExpenseFormState extends State<ExpenseForm> {
  final merchantController = TextEditingController();
  String selectedExpenseType = 'Ride-Sharing';
  final expenseTypes = ['Ride-Sharing', 'Restaurant', 'Breakfast', 'Fast Food'];
  final totalController = TextEditingController();
  DateTime? selectedDate;
  final commentController = TextEditingController();
  XFile? receiptImage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        receiptImage = image;
      });
    }
  }

  String formattedDate() {
    return selectedDate != null
        ? DateFormat('MM/dd/yyyy').format(selectedDate!)
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          const Text("Add Expense",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: merchantController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Merchant',
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String newValue) {
                  setState(() {
                    selectedExpenseType = newValue;
                    merchantController.text = selectedExpenseType;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return expenseTypes.map((String expenseType) {
                    return PopupMenuItem<String>(
                      value: expenseType,
                      child: Text(expenseType),
                    );
                  }).toList();
                },
              ),
            ),
          ),
          TextField(
            controller: totalController,
            decoration: const InputDecoration(labelText: 'Total'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: true,
                  readOnly: true,
                  controller: TextEditingController(text: formattedDate()),
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comment',
                style: TextStyle(fontSize: 14, ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextField(
                controller: commentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Enter your comment here',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
             const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Select Receipt'),
          ),
          if (receiptImage != null)
            Column(
              children: [
                const SizedBox(height: 10),
                Image.file(File(receiptImage!.path)),
              ],
            ),
        /*  ElevatedButton(
            onPressed: () {
              final merchant = merchantController.text;
              final total = totalController.text;
              final comment = commentController.text;
              // You can now use the 'merchant', 'selectedExpenseType', and 'total' values as needed.
              // The 'formattedDate()' function provides the formatted date.
              if (kDebugMode) {
                print('Merchant: $merchant');
                print('Expense Type: $selectedExpenseType');
                print('Total: $total');
                print('Date: ${formattedDate()}');
                print('Comment: $comment');
                print(
                    'Receipt Image Path: ${receiptImage?.path ?? "No Image Selected"}');
              }
            },
            child: const Text('Submit Expense'),
         ), */
        ],
      ),
    );
  }

  @override
  void dispose() {
    merchantController.dispose();
    totalController.dispose();
    super.dispose();
  }
}
