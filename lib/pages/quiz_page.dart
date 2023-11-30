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
  // reference the hive box
  final _sectionsBox = Hive.box('sectionsBox');
  CoursesDataBase db = CoursesDataBase();

  @override
  void initState() {
    super.initState();
    // if this is the 1st time ever opening the app, then create default data
    if (_sectionsBox.get("sectionsList") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    print(db.sections.length);
  }

  // Function to add a new element to db.sections
  void addNewSection() {
    String newSection = "New Section ${db.sections.length + 1}";
    db.sections.add(newSection);
    // Save the updated sections list to Hive
    _sectionsBox.put("sectionsList", db.sections);
    // Force a rebuild of the widget to reflect the changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List questionsTmp = [];
    for(var question in db.questions){
      if(question[0] == widget.idCourse){
        questionsTmp.add(question);
      }
    }
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("Quizz Page"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: questionsTmp.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questionsTmp[index].toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the function to add a new element to db.sections
          addNewSection();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
