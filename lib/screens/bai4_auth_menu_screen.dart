import 'package:flutter/material.dart';

class Bai4AuthMenuScreen extends StatelessWidget {
  const Bai4AuthMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      /// APPBAR TRONG SUỐT ĐẸP
      appBar: AppBar(
        title: const Text(
          "Bài 4 - Authentication",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 210, 209, 209).withOpacity(0.2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/mainpage');
          },
        ),
      ),

      body: Stack(
        children: [
          /// ẢNH NỀN SẮC NÉT 4K
          Positioned.fill(
            child: Image.network(
              "https://images.unsplash.com/photo-1506765515384-028b60a970df?auto=format&fit=crop&w=1600&q=80",
              fit: BoxFit.cover,
            ),
          ),

          /// LỚP PHỦ MỜ GIÚP FORM NỔI BẬT
          Container(
            color: Colors.black.withOpacity(0.45),
          ),

          /// FORM MENU Ở GIỮA
          Center(
            child: Container(
              width: 340,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  )
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Bài tập Login & Register",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// ITEM — ĐĂNG NHẬP
                  ListTile(
                    title: const Text(
                      "Đăng nhập",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.login, color: Colors.blue),
                    onTap: () => Navigator.pushNamed(context, '/login'),
                  ),
                  const Divider(),

                  /// ITEM — ĐĂNG KÝ
                  ListTile(
                    title: const Text(
                      "Đăng ký",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.person_add, color: Colors.green),
                    onTap: () => Navigator.pushNamed(context, '/register'),
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
