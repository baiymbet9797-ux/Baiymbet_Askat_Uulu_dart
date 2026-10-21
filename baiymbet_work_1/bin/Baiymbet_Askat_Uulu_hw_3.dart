import 'dart:io';

void main() {
  print('Start of program');
  for (int i = 1; i <= 30; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }
  print('--------------------');
  List<int> numbers = [3, -2, 0, 7, -5, 10, 1];
  int count = 0;
  int sum = 0;
  for (int number in numbers) {
    if (number > 0) {
      count++;
      sum += number;
    }
  }
  double average = count > 0 ? sum / count : 0.0;
  print('Positive number count : $count ');
  print('Average of positive numbers: $average');

  print('------------------');
  Map<String, int> fruits = {'Apple': 5, 'Banana': 2, 'Mango': 7, 'Orange': 0};
  fruits.forEach((key, value) {
    if(value>0)
    print('Available : $key, ($value pcs).');
  });
  print('End of program');
}
