import 'package:flutter/material.dart';

class CourseButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CourseButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4548E6),
            minimumSize: const Size(0, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}
