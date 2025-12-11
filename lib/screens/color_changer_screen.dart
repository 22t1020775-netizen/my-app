import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  // Danh sách màu & tên màu
  final List<Map<String, dynamic>> colors = [
    {"name": "Màu đỏ", "color": Colors.red},
    {"name": "Màu xanh", "color": Colors.blue},
    {"name": "Màu vàng", "color": Colors.yellow},
    {"name": "Màu cam", "color": Colors.orange},
    {"name": "Màu tím", "color": Colors.purple},
    {"name": "Màu đen", "color": Colors.black},
    {"name": "Màu hồng", "color": Colors.pink},
    {"name": "Màu xanh lá", "color": Colors.green},
  ];

  Color bgColor = Colors.white;
  String colorName = "Chưa chọn màu";

  void randomColor() {
    final random = Random();
    final index = random.nextInt(colors.length);

    setState(() {
      bgColor = colors[index]["color"];
      colorName = colors[index]["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Đổi màu nền"),
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/mainpage'),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              colorName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: bgColor == Colors.yellow ||
                        bgColor == Colors.orange ||
                        bgColor == Colors.pink
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: randomColor,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Đổi màu",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
