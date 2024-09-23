import 'package:mysql1/mysql1.dart';

class Database {
  // Correcting the class name to MySqlConnection
  static Future<MySqlConnection> connect() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      db: 'donation_tracker',  // Database name
      user: 'root',    // Database user
      password: 'jabir@1010',  // User's password
    );
    
    try {
      // Establish connection
      var connection = await MySqlConnection.connect(settings);
      print('Database connected successfully');
      return connection;
    } catch (e) {
      print('Failed to connect to the database: $e');
      rethrow;  // Optionally rethrow to let the calling code handle it
    }
  }
}
