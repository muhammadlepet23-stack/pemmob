import 'package:flutter/material.dart';
import 'biodata.dart';
import 'kontak.dart';
import 'kalkulator.dart';
import 'cuaca.dart';
import 'berita.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [BiodataPage(), KontakPage(), KalkulatorPage(), CuacaPage(), BeritaPage()];

  final List<String> _titles = ['Biodata', 'Kontak', 'Kalkulator', 'Cuaca', 'Berita'];

  void _openDrawerItem(int idx) {
    setState(() {
      _currentIndex = idx;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex]), elevation: 2),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/images/profile.jpg')),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text('Muhammad Daffa Hafizha Aulia\nNIM: 152023078', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Biodata'),
                onTap: () => _openDrawerItem(0),
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text('Kontak'),
                onTap: () => _openDrawerItem(1),
              ),
              ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text('Kalkulator'),
                onTap: () => _openDrawerItem(2),
              ),
              ListTile(
                leading: const Icon(Icons.wb_sunny),
                title: const Text('Cuaca'),
                onTap: () => _openDrawerItem(3),
              ),
              ListTile(
                leading: const Icon(Icons.article),
                title: const Text('Berita'),
                onTap: () => _openDrawerItem(4),
              ),
              const Spacer(),
              const Padding(padding: EdgeInsets.all(12.0), child: Text('UTS Mobile App — Created for assignment')),
            ],
          ),
        ),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: 'Biodata'),
          NavigationDestination(icon: Icon(Icons.contacts), label: 'Kontak'),
          NavigationDestination(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          NavigationDestination(icon: Icon(Icons.cloud), label: 'Cuaca'),
          NavigationDestination(icon: Icon(Icons.article), label: 'Berita'),
        ],
      ),
    );
  }
}
