import 'package:flutter/material.dart';

class Debt extends StatefulWidget {
  const Debt({Key? key}) : super(key: key);

  @override
  State<Debt> createState() => _DebtState();
}

class _DebtState extends State<Debt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Debts page')),
    );
  }
}
