// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';
import 'package:cybersafe_mx/models/models.dart';
import 'package:cybersafe_mx/pages/videoPage.dart';
import 'package:cybersafe_mx/utils/courseBtn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<ButtonData> buttonData = [];

  @override
  void initState() {
    loadButtonDataFromJson();
    super.initState();
  }

  Future<void> loadButtonDataFromJson() async {
    try {
      final String jsonData =
          await rootBundle.loadString('lib/assets/JSON/courses.json');
      final List<dynamic> jsonDataList = jsonDecode(jsonData);
      final data = jsonDataList.map((item) {
        return ButtonData(item['text'], item['action']);
      }).toList();
      setState(() {
        buttonData = data;
      });
    } catch (error) {
      print('Error al cargar el JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: buttonData.length,
        itemBuilder: (BuildContext context, int index) {
          return CourseButton(
            text: buttonData[index].text,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPlayer(
                          idCourse: index,
                          title: buttonData[index].text,
                          videoURL: buttonData[index].action,
                        )),
              );
            },
          );
        },
      ),
    );
  }
}
