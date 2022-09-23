import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final CollectionReference debtsData = FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.uid);

  Future updateUserData(String borrowers_name, String address, String contact,
      String amount, String date_offered, String date_payment) async {
    return debtsData.doc().set({
      'borrowers_name': borrowers_name,
      'address': address,
      'contact': contact,
      'amount': amount,
      'date_offered': date_offered,
      'date_payment': date_payment
    });
  }
}
