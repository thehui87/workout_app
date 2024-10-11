// // import 'package:flutter/material.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:permission_handler/permission_handler.dart';

// Future<bool> requestContactsPermission() async {
//   var status = await Permission.contacts.status;
//   if (status.isGranted) {
//     return true;
//   } else {
//     var result = await Permission.contacts.request();
//     return result.isGranted;
//   }
// }

// Future<List<Contact>> getContacts() async {
//   if (await requestContactsPermission()) {
//     Iterable<Contact> contacts = await ContactsService.getContacts();
//     return contacts.toList();
//   }
//   return [];
// }
