// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cybersafe_mx/helper/database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CoursesDataBase db = CoursesDataBase();

  @override
  Widget build(BuildContext context) {
    
    if (db.sectionsCompleted > 1) {
      return Scaffold(
        body: Center(
          child: Text("BADGE"),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text("Perfil ${db.sections}"),
        ),
      );
    }
  }
}
