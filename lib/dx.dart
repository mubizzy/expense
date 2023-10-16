// ignore_for_file: prefer_const_constructors

import 'package:demo_ville/data_table2.dart';
import 'package:demo_ville/view/alertdailog.dart';
import 'package:flutter/material.dart';

class Dx extends StatefulWidget {
  const Dx({super.key});

  @override
  State<Dx> createState() => _DxState();
}

class _DxState extends State<Dx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Manager"),
        actions: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadiusDirectional.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Info",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              infoDialog(context);
            },
          ),
          SizedBox(width: 10),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadiusDirectional.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('To be reimbursed'), Text('\$100000')],
              )),
              Text('Filters'),
              IconButton(
                icon: Icon(Icons.filter_alt_sharp),
                onPressed: () {
                  filterDialog(context);
                },
              )
            ],
          ),
          Expanded(
            child: DataTable2Demo(),
          ),
        ],
      )),
    );
  }
}
