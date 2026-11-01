import 'interface.dart';
import 'device.dart';
import 'mixins.dart';

class SmartLamp extends Device with BatteryPowered implements Adjustable {
  int brightness = 0;
  SmartLamp(String name) : super(name);
  @override
  void turnOn() {
    print('Lamp $name is ON');
  }
  @override
  void turnOff() {
    print('Lamp $name is OFF');
  }

  @override
  void increase() {
    if (brightness < 100) {
      brightness += 10;
    }
  }

  @override
  void decrease() {
    if (brightness > 0) {
      brightness -= 10;
    } 
  }

  @override
  void showInfo() {
    print('Device: $name Brightness: $brightness');
  }
}
