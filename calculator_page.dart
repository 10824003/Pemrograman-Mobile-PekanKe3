import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();

  double hasil = 0;

  void hitung(String op) {
    double a = double.tryParse(angka1.text) ?? 0;
    double b = double.tryParse(angka2.text) ?? 0;

    setState(() {
      if (op == "+") hasil = a + b;
      if (op == "-") hasil = a - b;
      if (op == "*") hasil = a * b;
      if (op == "/") {
        if (b != 0) {
          hasil = a / b;
        } else {
          showError("Tidak bisa dibagi 0!");
        }
      }
    });
  }

  void hitungSci(String op) {
    double a = double.tryParse(angka1.text) ?? 0;

    setState(() {
      if (op == "sin") hasil = sin(a);
      if (op == "cos") hasil = cos(a);
      if (op == "tan") hasil = tan(a);
      if (op == "sqrt") hasil = sqrt(a);
    });
  }

  void showError(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Error"),
        content: Text(msg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: angka1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka 1"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: angka2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka 2"),
            ),

            SizedBox(height: 20),

            // OPERASI DASAR
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () => hitung("+"), child: Text("+")),
                ElevatedButton(onPressed: () => hitung("-"), child: Text("-")),
                ElevatedButton(onPressed: () => hitung("*"), child: Text("×")),
                ElevatedButton(onPressed: () => hitung("/"), child: Text("÷")),
              ],
            ),

            SizedBox(height: 20),

            // SCIENTIFIC
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () => hitungSci("sin"), child: Text("sin")),
                ElevatedButton(onPressed: () => hitungSci("cos"), child: Text("cos")),
                ElevatedButton(onPressed: () => hitungSci("tan"), child: Text("tan")),
                ElevatedButton(onPressed: () => hitungSci("sqrt"), child: Text("√")),
              ],
            ),

            SizedBox(height: 30),

            Text(
              "Hasil: $hasil",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}