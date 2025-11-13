import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Halaman Cuaca
class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  // Ambil waktu saat ini
  late DateTime now;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // Format tanggal
    String formattedDate = DateFormat('EEEE, d MMM').format(now);
    // Ganti nama hari ke Bahasa Indonesia
    formattedDate = formattedDate
        .replaceAll('Monday', 'Senin')
        .replaceAll('Tuesday', 'Selasa')
        .replaceAll('Wednesday', 'Rabu')
        .replaceAll('Thursday', 'Kamis')
        .replaceAll('Friday', 'Jumat')
        .replaceAll('Saturday', 'Sabtu')
        .replaceAll('Sunday', 'Minggu');

    // Warna dasar ungu
    const primaryColor = Color(0xFF6A5ACD);

    return Scaffold(
      // appBar DIHAPUS agar tampilan gradien menjadi full-screen

      // Menggunakan Container dengan gradien sebagai latar belakang body
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF887CFF), // Ungu terang
              primaryColor, // Ungu lebih gelap
            ],
          ),
        ),
        // Tambahkan SafeArea agar konten tidak menimpa status bar
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Tanggal & Notifikasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formattedDate, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                    const Icon(Icons.notifications_none, color: Colors.white, size: 24),
                  ],
                ),
                const SizedBox(height: 16),

                // Lokasi
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.white, size: 20),
                    const SizedBox(width: 4),
                    const Text(
                      "Kebumen, Indonesia",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Suhu Utama dan Data Angin/Kelembaban
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Suhu Besar
                    const Text(
                      "18°",
                      style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),

                    // Data Angin, Kelembaban, dll.
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _DataRowItem(label: 'Angin', value: '342 km/j'),
                            _DataRowItem(label: 'Kelembaban', value: '25%'),
                            _DataRowItem(label: 'Titik Embun', value: '0°C'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Ikon Cuaca (Simulasi Awan, Matahari, Hujan)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Awan
                          const Icon(Icons.cloud, size: 120, color: Colors.white70),
                          // Matahari (di depan awan, sedikit menjorok)
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(color: Colors.yellow.withOpacity(0.5), blurRadius: 15.0)],
                              ),
                              child: const Icon(Icons.wb_sunny, size: 40, color: Colors.yellow),
                            ),
                          ),
                          // Efek hujan kecil (di bawah awan)
                          Positioned(
                            bottom: 10,
                            child: Column(
                              children: const [
                                Icon(Icons.water_drop, size: 14, color: Colors.lightBlue),
                                Icon(Icons.water_drop, size: 14, color: Colors.lightBlue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Bagian Prakiraan Kota Lain
                const Text(
                  "Kota Lain",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Daftar Horizontal Kota Lain
                SizedBox(
                  height: 150, // Tinggi tetap untuk ListView horizontal
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      // Kartu Kota Lain 1
                      _CityForecastCard(
                        city: 'Jakarta',
                        temp: '26°C',
                        wind: '367 km/j',
                        humidity: '30%',
                        icon: Icons.thunderstorm,
                        color: primaryColor,
                      ),
                      SizedBox(width: 15),

                      // Kartu Kota Lain 2
                      _CityForecastCard(
                        city: 'Surabaya',
                        temp: '28°C',
                        wind: '250 km/j',
                        humidity: '45%',
                        icon: Icons.wb_cloudy,
                        color: primaryColor,
                      ),
                      SizedBox(width: 15),

                      // Kartu Kota Lain 3
                      _CityForecastCard(
                        city: 'Yogyakarta',
                        temp: '24°C',
                        wind: '300 km/j',
                        humidity: '28%',
                        icon: Icons.cloud_off,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol "Lihat Semua"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Aksi untuk melihat semua kota
                    },
                    child: const Text("Lihat Semua >", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- WIDGET DATA BARIS KECIL (Angin, Kelembaban, dll.) ---
class _DataRowItem extends StatelessWidget {
  final String label;
  final String value;

  const _DataRowItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET KARTU KOTA LAIN (Other City Card) ---
class _CityForecastCard extends StatelessWidget {
  final String city;
  final String temp;
  final String wind;
  final String humidity;
  final IconData icon;
  final Color color;

  const _CityForecastCard({
    required this.city,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // Lebar tetap untuk kartu horizontal
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon & Kota
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  city,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Suhu
          Text(
            temp,
            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),

          // Detail Angin dan Kelembaban
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Angin: $wind', style: const TextStyle(color: Colors.white70, fontSize: 12)),
              Text('$humidity', style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
