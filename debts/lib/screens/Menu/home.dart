import 'package:debts/screens/information/profile.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference debtsData = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 203, 219),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Container(
            child: Column(
          children: [
            //First Row with the User Name and Circle Avator.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: Container(
                      child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 209, 185, 185),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  )),
                ),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.message,
                      color: Color.fromARGB(122, 23, 62, 134),
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.settings,
                      size: 30.0,
                      color: Color.fromARGB(122, 23, 62, 134),
                    )
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //the Second Row with the deposit option.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.heat_pump_rounded,
                  color: Colors.blue,
                  size: 40,
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Deposit',
                          style: TextStyle(
                            //   fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            // Expanded that has the List View and the contents.
            Expanded(
              child: StreamBuilder(
                  stream: debtsData.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> streamSnapsot) {
                    if (streamSnapsot.hasData) {
                      return ListView.builder(
                          itemCount: streamSnapsot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapsot.data!.docs[index];

                            return Container(
                                child: Column(
                              children: [
                                //Container(child: Text('list items')),
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        documentSnapshot[
                                                            'borrowers_name'],
                                                        style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'O/S',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      20,
                                                                      157,
                                                                      226),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(documentSnapshot[
                                                                  'contact']
                                                              .toString()),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'bottleProfit',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      20,
                                                                      157,
                                                                      226),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(documentSnapshot[
                                                                  'address']
                                                              .toString()),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'Cost',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      20,
                                                                      157,
                                                                      226),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(documentSnapshot[
                                                              'date_payment']),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]))),
                              ],
                            ));
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        )),
      ),
    );
  }
}
