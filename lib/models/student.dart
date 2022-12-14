// ignore_for_file: prefer_initializing_formals

class Student {
  late int id;
  String? firstName;
  late String lastName;
  late int grade;
  late String status;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id, String FirstName, String lastName, int grade) {
    this.id = id;
    this.firstName = FirstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade > 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Kaldı";
    }
    this.status = message;
    return this.status;
  }
}
