import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: contact.avatar != null ? AssetImage(contact.avatar!) : null,
          child: contact.avatar == null ? const Icon(Icons.person) : null,
        ),
        title: Text(contact.name),
        subtitle: Text(contact.phone),
        trailing: IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Panggilan simulasi: ${contact.phone}')));
          },
        ),
      ),
    );
  }
}
