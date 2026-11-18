

import 'package:logbook/screen/homescreen.dart';

import 'package:material_ui/material_ui.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Homescreen()
    );
  }
}
