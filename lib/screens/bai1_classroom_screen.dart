import 'package:flutter/material.dart';

// -------------------- MODEL LỚP HỌC --------------------
class Course {
  final String title;
  final String code;
  final int students;
  final String imageUrl;

  Course({
    required this.title,
    required this.code,
    required this.students,
    required this.imageUrl,
  });
}

// -------------------- DANH SÁCH LỚP --------------------
final List<Course> courses = [
  Course(
    title: 'XML và ứng dụng - Nhóm 1',
    code: '2025-2026.1.TIN4583.001',
    students: 58,
    imageUrl:
        'https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&w=900&q=80',
  ),
  Course(
    title: 'Lập trình ứng dụng cho các t...',
    code: '2025-2026.1.TIN4403.006',
    students: 55,
    imageUrl:
        'https://images.unsplash.com/photo-1513258496099-48168024aec0?auto=format&fit=crop&w=900&q=80',
  ),
  Course(
    title: 'Lập trình ứng dụng cho các t...',
    code: '2025-2026.1.TIN4403.005',
    students: 52,
    imageUrl:
        'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80',
  ),
  Course(
    title: 'Lập trình ứng dụng cho các t...',
    code: '2025-2026.1.TIN4403.004',
    students: 50,
    imageUrl:
        'https://images.unsplash.com/photo-1512428559087-560fa5ceab42?auto=format&fit=crop&w=900&q=80',
  ),
  Course(
    title: 'Lập trình ứng dụng cho các t...',
    code: '2025-2026.1.TIN4403.003',
    students: 48,
    imageUrl:
        'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80',
  ),
];

// -------------------- CARD HIỂN THỊ LỚP --------------------
class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(course.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.65),
              Colors.black.withOpacity(0.2),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // tên lớp + icon 3 chấm
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    course.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            const SizedBox(height: 4),

            // mã lớp
            Text(
              course.code,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
              ),
            ),

            const Spacer(),

            // số sinh viên
            Text(
              '${course.students} học viên',
              style: TextStyle(
                color: Colors.white.withOpacity(0.95),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- MÀN HÌNH BÀI 1 --------------------
class Bai1ClassroomScreen extends StatelessWidget {
  const Bai1ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 229, 231),

      // ---------------- APPBAR + NÚT THOÁT ----------------
      appBar: AppBar(
        title: const Text("Bài 1 - Classroom"),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/mainpage');
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text("Thoát"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),

        ],
      ),

      // ---------------- BODY ----------------
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CourseCard(course: courses[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
