import 'dart:io' show stdin;

void main() {
  print('Прогулка по погоде.');
  print('Введите ваш возраст');
  int? age = int.tryParse(stdin.readLineSync() ?? '');
  if (age == null) {
    return;
  }
  print('Введите температуру');
  int? temperature = int.tryParse(stdin.readLineSync() ?? '');
  if (temperature == null) {
    return;
  }

  if (age > 20 && age < 45 && temperature > -20 && temperature < 30) {
    print('You can go for a walk');
  } else if (age < 20 && temperature > 0 && temperature < 28) {
    print('You can go for a walk');
  } else if (age > 45 && temperature > -10 && temperature < 25) {
    print('You can go for a walk');
  } else {
    print('Stay at home');
  }
  print('Введите день недели (monday,tuesday,saturday.)');
  String input = (stdin.readLineSync() ?? '').trim().toLowerCase();
  switch (input) {
    case 'monday':
      print("It's start of the week !");
      break;
    case 'tuesday':
      print('Keep going, almost weekend!');
      break;
    case 'wednesday':
      print('Keep going, almost weekend!');
      break;
    case 'thursday':
      print('Keep going, almost weekend!');
      break;
    case 'friday':
      print(' Weekend is coming!');
      break;
    case 'saturday':
      print('Enjoy your weekend!');
      break;
    case 'sunday':
      print('Enjoy your weekend!');
      break;
    default:
      print('Invalid day.');
  }
  print('Введите пароль');
  String password = stdin.readLineSync() ?? '';
  if (password.isEmpty) {
    print('Password cannot be empty.');
  } else if (password.length < 6) {
    print('Password too short.');
  } else if (password == 'dart123') {
    print(' Access granted.');
  } else {
    print('Wrong password.');
  }
}
