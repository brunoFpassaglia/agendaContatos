import 'dart:async';

import 'package:agenda_contatos/models/contact.dart';
import 'package:hive/hive.dart';

class ContactHelper {
  final String _contacts = 'contacts';
  static final ContactHelper _instance = ContactHelper._();
  ContactHelper._();

  factory ContactHelper() => _instance;

  Future saveContact(Contact contact) async {
    await Hive.box(_contacts).add(contact);
  }

  Future updateContact(int key, Contact contact) async {
    await Hive.box(_contacts).put(key, contact);
  }

  Future<Contact> getContact(int id) async {
    return Hive.box(_contacts).get(id);
  }

  Future deleteContact(int id) async {
    await Hive.box(_contacts).delete(id);
  }

  Future getAllContacts() async {
    var data = Hive.box(_contacts).values;
    return List<Contact>.from(data);
  }
}
