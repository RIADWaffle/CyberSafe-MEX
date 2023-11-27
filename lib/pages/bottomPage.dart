// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cybersafe_mx/pages/courses_page.dart';
import 'package:cybersafe_mx/pages/help_page.dart';
import 'package:cybersafe_mx/pages/news_page.dart';
import 'package:cybersafe_mx/pages/profile_page.dart';
import 'package:cybersafe_mx/pages/videoPage.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
// cambio de pagina
  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// Index para el cambio de pagina
  int _selectedIndex = 0;

// Rutas de paginas
  final List _pages = [
    // cursos
    CoursesPage(),
    // noticias
    NewsPage(),
    // ayuda
    HelpPage(),
    // perfil
    VideoPlayer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      appBar: AppBar(
        title: Text(
          "Cybersafe-MX",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4548E6),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _changePage,
          items: [
            // cursos
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF4548E6),
              icon: Icon(
                Icons.book,
              ),
              label: "cursos",
            ),

            // noticias
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF4548E6),
              icon: Icon(Icons.newspaper),
              label: "noticias",
            ),

            // ayuda
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF4548E6),
              icon: Icon(Icons.help),
              label: "ayuda",
            ),

            // perfil
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF4548E6),
              icon: Icon(Icons.person),
              label: "perfil",
            ),
          ]),
    );
  }
}
