import 'package:logbook/widget/inputbox.dart';
import 'package:logbook/widget/inputdatebox.dart';
import 'package:material_ui/material_ui.dart';



class Formcomponent extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [ 
              Row(
                spacing:20,
                children: [
                  Expanded(child:Inputbox(title: "Task#", placeholder: 'Task No#'),),
                  
                  Expanded(child: InputDateBox(title: "Date"),) ],),
              Inputbox(title: "Title", placeholder: 'Task title'),
              Inputbox(title: "Description", placeholder: 'Task Description'),
              Inputbox(title: "Responsibility", placeholder: 'Responsible of Team/ Individual',minline: 3,),
              Inputbox(title: "Detail", placeholder: 'Detail process/Step taken',minline:3),
              Inputbox(title: "Problem", placeholder: 'Problem Encounter',minline: 3,),
              Inputbox(title: "Solution", placeholder: 'Problem solving process / approach',minline: 3,),
              Row(
                spacing: 20,
                children: [
                  Expanded(child:Inputbox(title: "Tools", placeholder: 'Hardware and Software Used'),),
                  
                  Expanded(child: Inputbox(title: "Other Tools", placeholder: 'System/Tools/software Architecture (if applicable)'))
                  ]
                  ),
              Inputbox(title: "Special remark", placeholder: 'Any Special things'),
              
              
               ],
            
          );
        
  }
}