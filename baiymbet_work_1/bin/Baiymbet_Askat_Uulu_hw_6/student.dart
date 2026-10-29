import 'person.dart';
import 'subject.dart';
class Student extends Person {
  Student(super.fullName, super.age, super.isMarried);
  Map<Subject, double> marks = {
    Subject.math: 90,
    Subject.physics: 85,
    Subject.english: 92,
    Subject.history: 76,
  };

  void showMarks() {
    print('Student: ${fullName}');
    for (var entry in marks.entries) {
      print('${entry.key.name} ${entry.value}');
    }
  }

  void introduce() {
    super.introduce();
    print('Average mark:${calculateAverage()}');
  }

  double calculateAverage() {
    double sum = 0;
    for (double mark in marks.values) {
      sum += mark;
    }
    return sum / marks.length;
  }
}

