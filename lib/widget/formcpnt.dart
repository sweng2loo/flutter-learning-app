import 'package:logbook/helpers/formcontrollers.dart';
import 'package:logbook/widget/inputbox.dart';
import 'package:logbook/widget/inputdatebox.dart';
import 'package:material_ui/material_ui.dart';



class Formcomponent extends StatelessWidget {
  final Formcontrollers controllers;
  
  const new({super.key,
  required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Form(
          key:controllers.formkey,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [ 
              Row(
                spacing:20,
                children: [
                  Expanded(child:Inputbox(title: "Task#", placeholder: 'Task No#',controller: controllers.taskNo,valid: controllers.validateInteger,cvfocusNode: controllers.taskNofocus,),),
                  
                  Expanded(child: InputDateBox(title: "Date",controller: controllers.date,valid: controllers.validateData,cvfocusNode: controllers.datefocus,),) ],),
              Inputbox(title: "Title", placeholder: 'Task title',controller: controllers.title,valid: controllers.validateData,cvfocusNode: controllers.titlefocus,),
              Inputbox(title: "Description", placeholder: 'Task Description',controller:controllers.description),
              Inputbox(title: "Responsibility", placeholder: 'Responsible of Team/ Individual',minline: 3,controller: controllers.responsibility,),
              Inputbox(title: "Detail", placeholder: 'Detail process/Step taken',minline:3,controller: controllers.detail,),
              Inputbox(title: "Problem", placeholder: 'Problem Encounter',minline: 3,controller: controllers.problem,),
              Inputbox(title: "Solution", placeholder: 'Problem solving process / approach',minline: 3,controller: controllers.solution,),
              Row(
                spacing: 20,
                children: [
                  Expanded(child:Inputbox(title: "Tools", placeholder: 'Hardware and Software Used',controller: controllers.tools,),),
                  
                  Expanded(child: Inputbox(title: "Other Tools", placeholder: 'System/Tools/software Architecture (if applicable)',controller: controllers.othertools,))
                  ]
                  ),
              Inputbox(title: "Special remark", placeholder: 'Any Special things',controller: controllers.specialremark,),
              
              
               ],
            
          )
    );
        
  }
}