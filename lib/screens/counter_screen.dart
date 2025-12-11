import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void increase() => setState(() => count++);
  void decrease() => setState(() => count--);
  void reset() => setState(() => count = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bộ đếm số"),
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/mainpage'),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(   // 🔥 Đảm bảo không bị ẩn nút
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$count",
                  style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 40),

                // 🔥 NÚT TĂNG
                ElevatedButton(
                  onPressed: increase,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)
                  ),
                  child: const Text("Tăng", style: TextStyle(fontSize: 20)),
                ),

                const SizedBox(height: 20),

                // 🔥 NÚT GIẢM
                ElevatedButton(
                  onPressed: decrease,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)
                  ),
                  child: const Text("Giảm", style: TextStyle(fontSize: 20)),
                ),

                const SizedBox(height: 20),

                // 🔥 NÚT ĐẶT LẠI
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)
                  ),
                  child: const Text("Đặt lại", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
