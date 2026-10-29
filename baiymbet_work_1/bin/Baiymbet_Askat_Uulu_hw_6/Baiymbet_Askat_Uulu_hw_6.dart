import 'person.dart';
import 'student.dart';
import 'teacher.dart';
import 'subject.dart';

void main() {
  Person person = Person('Alice Johnson', 30, true);
  person.introduce();
  Student student = Student('Chris Tucker', 23, false);
  student.showMarks();
  student.introduce();
  Teacher teacher = Teacher('Peter Parker', 34, true, 6);
  teacher.introduce();
  Student student1 = Student('Penny Rouse', 19, false);
  student1.marks = {Subject.math: 93, Subject.physics: 78, Subject.english: 86, Subject.history: 96};
  student1.introduce();
  student1.showMarks();
  Student student2 = Student('Bruno Mars', 22, false);
   student2.marks = {Subject.math: 96, Subject.physics:65, Subject.english:93, Subject.history: 88};
 student2.introduce();
  student2.showMarks();
}
