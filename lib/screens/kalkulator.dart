import 'package:flutter/material.dart';

// Definisi Warna
// Warna latar belakang gelap (mirip desain yang diunggah)
const Color darkBg = Color(0xFF3B3B5B);
// Warna tombol operasi dan tampilan
const Color primaryPurple = Color(0xFF6A5ACD);
// Warna tombol AC/Clear
const Color accentColor = Color(0xFF887CFF);
// Warna tombol sama dengan
const Color equalsColor = Color(0xFFFF9800);

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String output = "0"; // Nilai yang ditampilkan
  String _output = "0"; // Output sementara untuk perhitungan
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = ""; // Operator yang dipilih

  // Fungsi untuk menangani penekanan tombol
  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      num1 = double.tryParse(output) ?? 0.0;
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      }
      _output = _output + buttonText;
    } else if (buttonText == "=") {
      num2 = double.tryParse(output) ?? 0.0;

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "×") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          _output = "Error";
        }
      }

      // Mengatasi angka desimal yang terlalu panjang
      if (_output.contains('.') && _output.length > 10) {
        _output = double.parse(_output).toStringAsFixed(5);
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+/-") {
      // Mengubah tanda positif/negatif
      _output = (double.parse(_output) * -1).toString();
    } else if (buttonText == "%") {
      // Menghitung persentase
      _output = (double.parse(_output) / 100).toString();
    } else {
      if (_output == "0" || _output == "Error") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {
      output = _output;
    });
  }

  // Widget untuk membuat tombol kalkulator
  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.all(18.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            elevation: 4,
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: (buttonText.length > 1) ? 20.0 : 28.0, fontWeight: FontWeight.w500),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  // Widget untuk baris tombol
  Widget buildRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((text) {
        Color bgColor = primaryPurple;
        Color textColor = Colors.white;

        if (text == "AC") {
          bgColor = accentColor;
        } else if (text == "÷" || text == "×" || text == "-" || text == "+") {
          bgColor = primaryPurple; // Tombol operasi
        } else if (text == "=") {
          bgColor = equalsColor; // Tombol sama dengan
        } else if (text == "+/-" || text == "%") {
          bgColor = primaryPurple.withOpacity(0.8);
        } else {
          bgColor = primaryPurple; // Tombol angka dan desimal
        }

        return buildButton(text, bgColor, textColor);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg, // Latar belakang gelap untuk tampilan kontras
      // Hapus AppBar agar tampilan lebih menyatu, tapi tambahkan SafeArea
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Area Tampilan Hasil
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Text(
                  output.length > 12 ? (double.tryParse(output)?.toStringAsPrecision(8) ?? "Error") : output,
                  style: const TextStyle(
                    fontSize: 72.0, // Ukuran teks besar
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Pemisah
            const Divider(height: 1.0, color: Colors.white38),

            // Area Tombol
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    buildRow(["AC", "+/-", "%", "÷"]),
                    buildRow(["7", "8", "9", "×"]),
                    buildRow(["4", "5", "6", "-"]),
                    buildRow(["1", "2", "3", "+"]),
                    buildRow(["0", ".", "="]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
