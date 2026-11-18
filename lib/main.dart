

import 'dart:io';

import 'package:logbook/screen/homescreen.dart';

import 'package:material_ui/material_ui.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
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
