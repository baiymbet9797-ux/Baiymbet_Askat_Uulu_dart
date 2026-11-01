import 'device.dart';
import 'interface.dart';
import 'mixins.dart';
import 'smartlamp.dart';
import 'smartspeaker.dart';
import 'smartthermostat.dart';

void main() {
  List<Device> devices = [
    SmartLamp('Kitchen Lamp'),
    SmartSpeaker('Living Room Speaker'),
    SmartThermostat('Bedroom Thermostat'),
  ];
  for (Device d in devices) {
    d.showInfo();
    d.turnOn();

    if (d is Adjustable) {
      d.increase();
    }
    if (d is BatteryPowered) {
      d.showBattery();
    }
  }
  print('All devices processed');
}
