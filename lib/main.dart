// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutterfirstproject/models/student.dart';
import 'package:flutterfirstproject/screens/stundets_add.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Oğuzcan ", "Akyüz", 99),
    Student.withId(3, "Rumeysa ", "Çapraz", 100),
    Student.withId(2, "Seyfullah ", "Savaş", 34),
  ];

  Student selectedStudent = Student.withId(0, "0", "0", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      students[index].firstName! + (students[index].lastName)),
                  subtitle: Text(
                      "Sınavdan Aldığı Not: ${students[index].grade}[${students[index].getStatus}]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/User_icon-cp.svg/728px-User_icon-cp.svg.png"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                    print(selectedStudent.firstName);
                  },
                  onLongPress: () {
                    print("Uzun Tıklandi");
                  },
                ); //öğrencilerin i'ninci elamanı önce bir sonra iki gibi çalışır
              }),
        ),
        Text("Seçili Öğrenci ${selectedStudent.firstName}"),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color
                ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni Öğrenci")
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  print("sdsd");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color
                ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle")
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  print("sdsd");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil")
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
