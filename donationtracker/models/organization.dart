import 'package:mysql1/mysql1.dart';

class Organization {
  final int id;
  final String name;
  final String description;

  Organization({required this.id, required this.name, required this.description});

  static Future<List<Organization>> getAll(MySqlConnection conn) async {
    var results = await conn.query('SELECT * FROM organizations');
    return results.map((row) => Organization(
      id: row['id'],
      name: row['name'],
      description: row['description'],
    )).toList();
  }
}