import 'interface.dart';
import 'device.dart';
import 'mixins.dart';

class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume = 0;
  
  SmartSpeaker(String name) : super(name);
  @override
   void turnOn() {
    print('Speaker $name is ON');
  }
@override
  void turnOff() {
    print('Speaker $name is OFF');
  }
@override
  void increase() {
    if (volume < 100) {
      volume += 5;
    }
  }
@override
  void decrease() {
    if (volume > 0) {
      volume -= 5;
    } 
  }
@override
  void showInfo() {
    print('Device: $name Volume: $volume');
  }
}
