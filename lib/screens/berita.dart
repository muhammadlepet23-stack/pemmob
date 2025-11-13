import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  List<Map<String, String>> _fakeNews() {
    return [
      {
        'title': 'Berita 1: Perkembangan Teknologi',
        'subtitle': 'Ringkasan berita singkat yang menarik perhatian pembaca.',
        'image': 'assets/images/news1.jpg',
      },
      {
        'title': 'Berita 2: Ekonomi Tumbuh',
        'subtitle': 'Ringkasan tentang perkembangan ekonomi terbaru.',
        'image': 'assets/images/news2.jpg',
      },
      // Duplicate pattern to show list
      for (int i = 3; i <= 8; i++)
        {
          'title': 'Berita $i: Judul Berita contoh $i',
          'subtitle': 'Ini adalah ringkasan singkat berita nomor $i.',
          'image': 'assets/images/news1.jpg',
        },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final news = _fakeNews();
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, i) {
        final item = news[i];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(item['image']!, width: 80, height: 80, fit: BoxFit.cover),
            ),
            title: Text(item['title']!),
            subtitle: Text(item['subtitle']!),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(item['title']!),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(item['image']!),
                      const SizedBox(height: 8),
                      Text(item['subtitle']!),
                      const SizedBox(height: 8),
                      const Text('Isi berita penuh simulasi - hanya demo UTS.'),
                    ],
                  ),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
