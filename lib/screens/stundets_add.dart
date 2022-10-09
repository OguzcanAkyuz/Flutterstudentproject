import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  var student = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
        decoration:
            InputDecoration(labelText: "Öğrenci Adı", hintText: "Oğuzcan"),
        onSaved: ((newValue) => student.firstName));
  }

  Widget buildLastNameField() {
    return TextFormField(
        decoration:
            InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Akyüz"),
        onSaved: ((newValue) => student.lastName));
  }

  Widget buildGradeField() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Aldığı Not", hintText: "55"),
        onSaved: ((newValue) => student.grade));
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
      child: Text("Kaydet"),
    );
  }
}
