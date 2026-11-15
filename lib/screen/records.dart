import 'package:logbook/widget/inputbox.dart';
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
      backgroundColor: const Color.fromARGB(255, 117, 117, 115), 
      body: 
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.fromLTRB(150, 70 , 150, 70),
            decoration: BoxDecoration(color: Colors.white,boxShadow:[
              BoxShadow(color: Colors.black.withOpacity(0.3),  // shadow color
                blurRadius: 8,        // how soft/blurry
                spreadRadius: 2,      // how far it extends beyond the box
                offset: const Offset(0, 4),)] ),
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [
              Inputbox(title: "Date", placeholder: 'Date'),
              Inputbox(title: "Task#", placeholder: 'Task No#'),
              Inputbox(title: "Title", placeholder: 'Task title'),
              Inputbox(title: "Description", placeholder: 'Task Description'),
              Inputbox(title: "Responsibility", placeholder: 'Responsible of Team/ Individual'),
              Inputbox(title: "Detail", placeholder: 'Detail process/Step taken'),
              Inputbox(title: "Problem", placeholder: 'Problem Encounter'),
              Inputbox(title: "Solution", placeholder: 'Problem solving process / approach'),
              Inputbox(title: "Tools", placeholder: 'Hardware/ Software Used (if applicable)'),
              Inputbox(title: "Other Tools", placeholder: 'System/Tools/software Architecture (if applicable)'),
              Inputbox(title: "Special remark", placeholder: 'Any Special things'),
              
               ],
            )
          ),
        ),
  
    );
  }
}