import 'dart:io';

void main() {
  greet();
  greet();
  greet();
  introduce('ALex', 25);
  introduce('Nick', 18);
  introduce('Ursula', 23);
  addNumbers(134, 422);
  print('Final prise : \$${calculateDiscount(price: 500)}');
  print('Final prise: \$${calculateDiscount(price: 500, discount: 15)}');
  print(
    'Final prise: \$${calculateDiscount(price: 500, discount: 15, tax: 3)}',
  );
  print('Total function calls: $totalCalls');
}

int totalCalls = 0;
void greet() {
  print(' Hello! Welcome to Dart programming!');
  totalCalls++;
}

void introduce(String name, int age) {
  print('My name is $name and I am $age years old.');
  totalCalls++;
}

void addNumbers(int num1, int num2) {
  int result = num1 + num2;
  print('Sum of $num1 and $num2 is $result');
  totalCalls++;
}

double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  double finalPrice = price - (price * discount / 100) + (price * tax / 100);
  totalCalls++;
  return finalPrice;
}
