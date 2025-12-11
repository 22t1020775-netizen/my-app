import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 12,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(28),   // Bo tròn bên trái
          right: Radius.circular(28),  // Bo tròn bên phải
        ),
      ),
      child: ClipRRect(  // Đảm bảo nội dung bên trong cũng bo tròn theo
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(28),
          right: Radius.circular(28),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            _hoverItem(context, Icons.home, "Mainpage", "/mainpage"),
            _hoverItem(context, Icons.class_, "Bài 1 - Classroom", "/bai1"),
            _hoverItem(context, Icons.hotel, "Bài 2 - Hotel List", "/hotel_list_file"),
            _hoverItem(context, Icons.color_lens, "Bài 3 - Color & Timer", "/bai3"),
            _hoverItem(context, Icons.lock_open, "Bài 4 - Auth Demo", "/auth"),
            _hoverItem(context, Icons.shopping_bag, "Bài 5 - Product", "/products"),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade700,
            Colors.blue.shade400,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),   // Bo tròn góc trên trái
          topRight: Radius.circular(28),  // Bo tròn góc trên phải
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.school, size: 50, color: Colors.white),
          SizedBox(width: 15),
          Text(
            "Phan Thị Kiều Trinh",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _hoverItem(
      BuildContext context, IconData icon, String title, String route) {
    bool isHover = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            transform: Matrix4.identity()..scale(isHover ? 1.05 : 1.0),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), // Bo tròn item
              color: isHover ? Colors.blue.withOpacity(0.15) : Colors.transparent,
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.35),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      )
                    ]
                  : [],
            ),
            child: ListTile(
              leading: Icon(
                icon,
                size: 28,
                color: isHover ? Colors.blue.shade700 : Colors.black87,
              ),
              title: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: isHover ? 18 : 16,
                  fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
                  color: isHover ? Colors.blue.shade700 : Colors.black87,
                ),
                child: Text(title),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, route);
              },
            ),
          ),
        );
      },
    );
  }
}