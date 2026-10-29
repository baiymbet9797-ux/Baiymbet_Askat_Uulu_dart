class Person {
  String fullName;
  int age;
  bool isMarried;

  Person(this.fullName, this.age, this.isMarried);

  void introduce() {
    print(
      'Hi! My name is $fullName. I am $age years old. Married: ${isMarried ? 'Yes' : 'No'}.',
    );
  }
}

/*enum Subject { math, physics, english, history }

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

class Teacher extends Person {
  Teacher(super.fullName, super.age, super.isMarried, this.experience);
  int experience;
  static double _baseSalary = 50000;

  double calculateSalary() {
    double salary = _baseSalary;
    if (experience > 3) {
      for (int i = 4; i <= experience; i++) {
        salary = salary + salary * 0.05;
      }
    }
    if (isMarried == true) {
      salary = salary + 5000;
    }
    return salary;
  }

  void introduce() {
    super.introduce();
    print('Experience: $experience years.');
    print('Salary: ${calculateSalary()}');
  }
}*/
