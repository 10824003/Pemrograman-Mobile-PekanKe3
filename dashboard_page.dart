import 'package:flutter/material.dart';
import 'calculator_page.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  // GREETING
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Selamat Pagi";
    } else if (hour >= 12 && hour < 15) {
      return "Selamat Siang";
    } else if (hour >= 15 && hour < 18) {
      return "Selamat Sore";
    } else {
      return "Selamat Malam";
    }
  }

  @override
  Widget build(BuildContext context) {
    String greeting = getGreeting();

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ICON USER
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),

            SizedBox(height: 15),

            // GREETING
            Text(
              greeting,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            // USERNAME
            Text(
              "Selamat datang kembali, $username!",
              style: TextStyle(color: Colors.grey[600]),
            ),

            SizedBox(height: 30),

            // CARD KALKULATOR
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CalculatorPage(),
                  ),
                );
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [

                      // 🔥 ICON KALKULATOR MIRIP ASLI
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // LAYAR
                            Container(
                              margin: EdgeInsets.all(6),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),

                            // TOMBOL
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 3,
                                padding: EdgeInsets.all(6),
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                children: List.generate(9, (index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: (index == 2 || index == 5 || index == 8)
                                          ? Colors.orange
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Kalkulator",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            // BIODATA
            Text("Nama: Muh Abdul Gani"),
            Text("NIM: 10824003"),

            SizedBox(height: 20),

            // LOGOUT
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
              label: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}