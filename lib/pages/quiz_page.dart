import 'package:cybersafe_mx/models/quizzes_model.dart';

import 'package:cybersafe_mx/main.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../helper/database.dart';

class QuizzPage extends StatefulWidget {
  final int idCourse;

  const QuizzPage({Key? key, required this.idCourse}) : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final _sectionsBox = Hive.box('sectionsBox');
  CoursesDataBase db = CoursesDataBase();
  List<int?> selectedOptions = [];
  List questionsTmp = [];

  @override
  void initState() {
    
    if (_sectionsBox.get("sectionsList") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    questionsTmp = db.questions
        .where((question) => question[0] == widget.idCourse)
        .toList();
    selectedOptions = List.filled(questionsTmp.length, null);

    for(var answer in questionsTmp){
      print(answer[3]);
    }
    super.initState();
  }

  void updateSession(int idSection) {
    setState(() {
      db.sections[idSection-1][2] = 1;
      
    });
    print(db.sections);
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void handleOptionSelected(int questionIndex, int selectedOption) {
    setState(() {
      selectedOptions[questionIndex] = selectedOption;
    });
  }

  void calculateGrade() {
    int correctCount = 0;

    for (int i = 0; i < selectedOptions.length; i++) {
      if (selectedOptions[i] == questionsTmp[i][3]) {
        correctCount++;
      }
    }

    double percentage = (correctCount / questionsTmp.length) * 100;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Result'),
        content: Text('Your grade: $percentage%'),
        actions: [
          TextButton(
            onPressed: () {
              if (percentage > 80) {
                //updateSession(widget.idCourse);
                db.sections[widget.idCourse-1][2] = 1;
                db.sectionsCompleted++;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Congrats! You did well!\nSections Completed: ${db.sectionsCompleted}/${db.sections.length}',
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You could do it better next time!!'),
                  ),
                );
              }
                  Navigator.of(context).pop();
              if(db.sectionsCompleted>=db.sections.length){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Congrats You have completed the course!',
                    ),
                  ),
                );
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("Quizz Page"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: questionsTmp.length,
        itemBuilder: (context, index) {
          return QuizCard(
            question: questionsTmp[index],
            questionIndex: index,
            selectedOptions: selectedOptions,
            onOptionSelected: handleOptionSelected,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              if (selectedOptions.contains(null)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Please answer all questions before submitting.'),
                  ),
                );
              } else {
                calculateGrade();
              }
              db.updateDataBase();
            },
            child: const Text('Submit'),
          ),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final List question;
  final int questionIndex;
  final List<int?> selectedOptions;
  final Function(int, int) onOptionSelected;

  const QuizCard({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.selectedOptions,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question[1],
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            for (int i = 0; i < question[2].length; i++)
              RadioListTile<int>(
                title: Text(question[2][i]),
                value: i,
                groupValue: selectedOptions[questionIndex],
                onChanged: (value) {
                  onOptionSelected(questionIndex, value!);
                },
              ),
          ],
        ),
      ),
    );
  }
}
