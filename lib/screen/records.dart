import 'package:logbook/helpers/my_flutter_app.dart';
import 'package:logbook/widget/formcpnt.dart';

import 'package:material_ui/material_ui.dart';

class Records extends StatefulWidget {
  const new({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 56, 55), 
      body:Padding(
        padding: EdgeInsetsGeometry.all(30),
        child:SingleChildScrollView( 
        scrollDirection: Axis.vertical,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [ 
              Icon(
                MyFlutterApp.homelogo, 
                size: 180,
                color: Colors.amber,),
              Formcomponent()
              ],
          )
        )
      )
    );
  }
}