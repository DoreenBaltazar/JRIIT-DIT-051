// import 'dart:io';
// import 'package:mysql1/mysql1.dart';

// import '../models/donation.dart';
// import '../models/organization.dart';
// import '../utils/db.dart';
// import '../lib/donation.dart';

// void main() async {
//   final conn = await Database.connect();

//   // Command-line interface
//   while (true) {
//     print('Donation Tracker');
//     print('----------------');
//     print('1. Add donation');
//     print('2. View donations');
//     print('3. Exit');
//     final choice = stdin.readLineSync() ?? '';

//     switch (choice) {
//       case '1':
//         await addDonation(conn);
//         break;
//       case '2':
//         await viewDonations(conn);
//         break;
//       case '3':
//         exit(0);
//       default:
//         print('Invalid choice. Please try again.');
//     }
//   }
// }

// // Function to add a donation
// Future<void> addDonation(MySqlConnection conn) async {
//   print('Enter donor name:');
//   final donorName = stdin.readLineSync() ?? '';

//   print('Enter donation amount:');
//   final amountStr = stdin.readLineSync() ?? '';
//   final amount = double.tryParse(amountStr);

//   if (amount == null) {
//     print('Invalid amount. Please try again.');
//     return;
//   }

//   print('Enter organization ID:');
//   final orgIdStr = stdin.readLineSync() ?? '';
//   final orgId = int.tryParse(orgIdStr);

//   if (orgId == null) {
//     print('Invalid organization ID. Please try again.');
//     return;
//   }

//   // Assuming you have a Donation model with a method to insert into the database
//   final donation = Donation(
//     donorName: donorName,
//     amount: amount,
//     organizationId: orgId,
//   );

//   await donation.save(conn);  // Save the donation in the database

//   print('Donation added successfully!');
// }

// // Function to view all donations
// Future<void> viewDonations(MySqlConnection conn) async {
//   // Assuming you have a method to retrieve donations from the Donation model
//   final donations = await Donation.getAll(conn);

//   if (donations.isEmpty) {
//     print('No donations found.');
//   } else {
//     print('Donations:');
//     for (var donation in donations) {
//       print('Donor: ${donation.donorName}, Amount: ${donation.amount}, Organization ID: ${donation.organizationId}');
//     }
//   }
// }

import 'dart:io';
import 'package:donationtracker/donation.dart';
import 'package:mysql1/mysql1.dart';
import '../models/organization.dart';
import '../utils/db.dart';

void main() async {
  final conn = await Database.connect();

  // Command-line interface
  while (true) {
    print('Donation Tracker');
    print('----------------');
    print('1. Add donation');
    print('2. View donations');
    print('3. Exit');
    final choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        await addDonation(conn);
        break;
      case '2':
        await viewDonations(conn);
        break;
      case '3':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

// Function to add a donation
Future<void> addDonation(MySqlConnection conn) async {
  print('Enter donor name:');
  final donorName = stdin.readLineSync() ?? '';

  print('Enter donation amount:');
  final amountStr = stdin.readLineSync() ?? '';
  final amount = double.tryParse(amountStr);

  if (amount == null) {
    print('Invalid amount. Please try again.');
    return;
  }

  print('Enter organization ID:');
  final orgIdStr = stdin.readLineSync() ?? '';
  final orgId = int.tryParse(orgIdStr);

  if (orgId == null) {
    print('Invalid organization ID. Please try again.');
    return;
  }

  // Create a new Donation instance with the required parameters
  final donation = Donation(
    id: DateTime.now()
        .millisecondsSinceEpoch
        .toString(), // Unique ID generation
    organization_id: donorName,
    amount: amount,
    date: DateTime.now(), // Set the current date
  );

  await donation.insertDonation(conn); // Save the donation in the database

  print('Donation added successfully!');
}

// Function to view all donations
Future<void> viewDonations(MySqlConnection conn) async {
  // Assuming you have a method to retrieve donations from the Donation model
  final donations = await Donation.getAll(
      conn); // Update this to your method of fetching donations

  if (donations.isEmpty) {
    print('No donations found.');
  } else {
    print('Donations:');
    for (var donation in donations) {
      print(
          'Donor: ${donation.donorName}, Amount: ${donation.amount}, Date: ${donation.date}');
    }
  }
}
