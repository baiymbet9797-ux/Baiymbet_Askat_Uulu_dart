import 'person.dart';

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
}
