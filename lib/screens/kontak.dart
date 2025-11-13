import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/contact_card.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  List<Contact> _generateContacts() {
    return List.generate(15, (i) {
      int idx = i + 1;
      return Contact(
        name: 'Kontak $idx',
        phone: '+62 812-0000-00${idx.toString().padLeft(2, '0')}',
        avatar: null, // or 'assets/profile.jpg' to show same avatar
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final contacts = _generateContacts();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactCard(contact: contacts[index]);
      },
    );
  }
}
