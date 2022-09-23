//import 'dart:html';

import 'package:debts/screens/Menu/borrow.dart';
import 'package:debts/screens/Menu/debt.dart';
import 'package:debts/screens/Menu/home.dart';
import 'package:debts/screens/Menu/lend.dart';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentIndex = 0;
  final screens = [
    Home(),
    Lend(),
    Borrow(),
    Debt(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          //  backgroundColor: Color.fromARGB(255, 183, 203, 219),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.broadcast_on_home),
              label: 'Lend',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money_off),
              label: 'Borrow',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money_off),
              label: 'Debts',
            ),
          ]),
    );
  }
}
