import 'package:sb4024_controller/sb4024_controller.dart';

void main() {
  final controller =
      SB4024Controller(baseHttpAddress: Uri.parse('http://192.168.10.135'));
  controller.loadPreset(3).then((value) => print(value));
}
