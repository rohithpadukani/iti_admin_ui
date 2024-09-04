import 'package:flutter/material.dart';
import 'package:iti_admin_mod/views/departments_page.dart';
import 'package:iti_admin_mod/views/holidays_page.dart';
import 'package:iti_admin_mod/views/staffs_page.dart';
import 'package:iti_admin_mod/views/students_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemIndex = 0;

  final List<Widget> pages = [
  
    const StudentsPage(),
    const StaffsPage(),
    const DepartmentsPage(),
    const HolidaysPage(),
    const Center(
      child: Text('Attendance Page'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          //sidebar
          Container(
            padding: const EdgeInsets.all(20),
            width: screenWidth / 6,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Admin Panel',
                  style: TextStyle(
                      color: Color(0xff5473FF),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildMenuItem(index: 0, title: 'Students', icon: Icons.people_rounded),
                _buildMenuItem(index: 1, title: 'Staff', icon: Icons.work),
                _buildMenuItem(index: 2, title: 'Departments', icon: Icons.business),
                _buildMenuItem(index: 3, title: 'Holiday', icon: Icons.calendar_today),
                _buildMenuItem(index: 4, title: 'Attendance', icon: Icons.check_circle_rounded),
              ],
            ),
          ),
          Expanded(child: pages[itemIndex]),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required int index, required String title, required IconData icon}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: itemIndex == index ? const Color(0xff5473FF) : const Color(0xff797676),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  
                  color: itemIndex == index ? const Color(0xff5473FF) : const Color(0xff797676),),
            )
          ],
        ),
      ),
    );
  }
}
