import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text(
          "___HOME___",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 216, 218),
        centerTitle: true,
        elevation: 3,
      ),

      body: Stack(
        children: [
          // Ảnh nền
          // Positioned.fill(
          //   child: Image.network(
          //     "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?auto=format&fit=crop&w=1600&q=80",
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // Lớp mờ nền
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Nội dung chính với hiệu ứng hover nhẹ nhàng
          Center(
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.transparent,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Chào mừng đến với môn Flutter Dart!")),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: Text(
                    "Flutter Dart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22, // Giữ nguyên kích thước, không thay đổi khi hover
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      letterSpacing: 1.2,
                      // Hiệu ứng bóng nhẹ + glow tinh tế khi hover
                      shadows: _isHovered
                          ? [
                              const Shadow(
                                color: Colors.white,
                                blurRadius: 12,
                                offset: Offset(0, 0),
                              ),
                              Shadow(
                                color: Colors.white.withOpacity(0.6),
                                blurRadius: 24,
                                offset: const Offset(0, 0),
                              ),
                              const Shadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ]
                          : [
                              const Shadow(
                                color: Colors.black45,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}