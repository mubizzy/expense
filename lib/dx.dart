import 'package:demo_ville/data_table2.dart';
import 'package:demo_ville/data_table_fixed.dart';
import 'package:flutter/material.dart';

class Dx extends StatefulWidget {
  const Dx({super.key});

  @override
  State<Dx> createState() => _DxState();
}

class _DxState extends State<Dx> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("hhhhh"),
          Text("hhhhh"),
          Text("hhhhh"),
          Expanded(
            child: DataTable2Demo(),
          ),
        ],
      )),
    );
  }
}
