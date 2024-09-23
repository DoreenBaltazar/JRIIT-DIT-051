// // donation.dart

// import 'package:mysql1/mysql1.dart';

// class Donation {
//   final String id;
//   final String donorName;
//   final double amount;
//   final DateTime date;

//   Donation({required this.id, required this.donorName, required this.amount, required this.date});

//   // Method to insert donation into the database
//   Future<void> insertDonation(MySqlConnection conn) async {
//     var query = 'INSERT INTO donations (id, donor_name, amount, date) VALUES (?, ?, ?, ?)';
//     await conn.query(query, [id, donorName, amount, date]);
//   }
// }

import 'package:mysql1/mysql1.dart';

class Donation {
  final String id;
  final String organization_id;
  final double amount;
  final DateTime date;

  Donation({
    required this.id,
    required this.organization_id,
    required this.amount,
    required this.date,
  });

  // Method to insert donation into the database
  Future<void> insertDonation(MySqlConnection conn) async {
    var query =
        'INSERT INTO donations (id, organization_id, amount, date) VALUES (?, ?, ?, ?)';
    await conn.query(query, [id, organization_id, amount, date]);
  }

  static getAll(MySqlConnection conn) {}
}
