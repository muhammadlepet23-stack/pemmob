class Contact {
  final String name;
  final String phone;
  final String? avatar; // optional asset path

  Contact({required this.name, required this.phone, this.avatar});
}
