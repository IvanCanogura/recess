import 'package:debts/services/database.dart';
import 'package:flutter/material.dart';

class Lend extends StatefulWidget {
  const Lend({Key? key}) : super(key: key);

  @override
  State<Lend> createState() => _LendState();
}

class _LendState extends State<Lend> {
  String borrowers_name = '';
  String address = '';
  String contact = '';
  String amount = '';
  String date_offered = '';
  String date_payment = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 183, 203, 219),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
          child: Container(
              child: SingleChildScrollView(
            child: Form(
                child: Column(
              children: [
                Text('Add Borrowers',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Color.fromARGB(255, 22, 22, 22),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Borrower`s Name',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (val) {
                    setState(() {
                      borrowers_name = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Address',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (val) {
                    setState(() {
                      address = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Contact',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (val) {
                    setState(() {
                      contact = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Amount',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (val) {
                    setState(() {
                      amount = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Date Offered',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (val) {
                    setState(() {
                      date_offered = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Date Of Payment',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (val) {
                    setState(() {
                      date_payment = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(15.0)),
                  onPressed: () async {
                    await DatabaseService().updateUserData(borrowers_name,
                        address, contact, amount, date_offered, date_payment);
                  },
                  label: Text(
                    'Lend',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: Icon(
                    // <-- Icon
                    Icons.send,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            )),
          )),
        ));
  }
}
