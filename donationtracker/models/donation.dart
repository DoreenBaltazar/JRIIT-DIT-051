// import 'package:mysql1/mysql1.dart';

// class Donation {
//   final int id;
//   final int organizationId;
//   final double amount;
//   final DateTime date;

//   Donation({required this.id, required this.organizationId, required this.amount, required this.date});

//   static Future<List<Donation>> getAll(MySqlConnection conn) async {
//     var results = await conn.query('SELECT * FROM donations');
//     return results.map((row) => Donation(
//       id: row['id'],
//       organizationId: row['organization_id'],
//       amount: row['amount'],
//       date: row['date'],
//     )).toList();
//   }

//   static Future<void> create(MySqlConnection conn, Donation donation) async {
//     await conn.query('INSERT INTO donations (organization_id, amount, date) VALUES (?, ?, ?)',
//       [donation.organizationId, donation.amount, donation.date]);
//   }
// }