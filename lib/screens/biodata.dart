import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});
  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String? _selectedGender = 'Laki-laki';
  String _selectedProgram = 'Informatika';
  DateTime? _birthDate;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  Future<void> _pickDate() async {
    final today = DateTime.now();
    final initial = _birthDate ?? DateTime(today.year - 20);
    final dt = await showDatePicker(context: context, initialDate: initial, firstDate: DateTime(1950), lastDate: today);
    if (dt != null) {
      setState(() => _birthDate = dt);
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final df = _birthDate == null ? 'Pilih Tanggal' : DateFormat.yMMMMd().format(_birthDate!);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Hero(
              tag: 'profile',
              child: CircleAvatar(radius: 64, backgroundImage: AssetImage('assets/images/profile.jpg')),
            ),
          ),
          const SizedBox(height: 12),
          Text('Muhammad Daffa Hafizha Aulia', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.account_circle),
                      const SizedBox(width: 8),
                      const Expanded(child: Text('NIM: 152023078')),
                    ],
                  ),
                  const Divider(),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Alamat (tidak disimpan)'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedProgram,
                    items: const [
                      DropdownMenuItem(value: 'Informatika', child: Text('Informatika')),
                      DropdownMenuItem(value: 'Sistem Informasi', child: Text('Sistem Informasi')),
                      DropdownMenuItem(value: 'Teknik Komputer', child: Text('Teknik Komputer')),
                    ],
                    onChanged: (v) => setState(() => _selectedProgram = v!),
                    decoration: const InputDecoration(labelText: 'Program Studi'),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Jenis Kelamin:'),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Laki-laki',
                              groupValue: _selectedGender,
                              onChanged: (v) => setState(() => _selectedGender = v),
                            ),
                            const Text('Laki-laki'),
                            Radio<String>(
                              value: 'Perempuan',
                              groupValue: _selectedGender,
                              onChanged: (v) => setState(() => _selectedGender = v),
                            ),
                            const Text('Perempuan'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: 10),
                      TextButton(onPressed: _pickDate, child: Text(df)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _bioController,
                    decoration: const InputDecoration(labelText: 'Bio singkat'),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Data hanya demo, tidak disimpan.')));
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Simpan (demo)'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
