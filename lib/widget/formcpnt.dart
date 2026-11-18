import 'package:logbook/helpers/formcontrollers.dart';
import 'package:logbook/widget/inputbox.dart';
import 'package:logbook/widget/inputdatebox.dart';
import 'package:material_ui/material_ui.dart';



class Formcomponent extends StatelessWidget {
  final Formcontrollers controllers;
  final bool editmode;
  
  const new({super.key,
  required this.controllers,
  this.editmode = true});

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
                  Expanded(child:Inputbox(title: "Task#", placeholder: 'Task No#',controller: controllers.taskNo,valid: controllers.validateInteger,cvfocusNode: controllers.taskNofocus,editmode: editmode,),),
                  
                  Expanded(child: InputDateBox(title: "Date",controller: controllers.date,valid: controllers.validateData,cvfocusNode: controllers.datefocus,editmode: editmode,),) ],),
              Inputbox(title: "Title", placeholder: 'Task title',controller: controllers.title,valid: controllers.validateData,cvfocusNode: controllers.titlefocus,editmode: editmode,),
              Inputbox(title: "Description", placeholder: 'Task Description',controller:controllers.description,editmode: editmode,),
              Inputbox(title: "Responsibility", placeholder: 'Responsible of Team/ Individual',minline: 3,controller: controllers.responsibility,editmode: editmode,),
              Inputbox(title: "Detail", placeholder: 'Detail process/Step taken',minline:3,controller: controllers.detail,editmode: editmode,),
              Inputbox(title: "Problem", placeholder: 'Problem Encounter',minline: 3,controller: controllers.problem,editmode: editmode,),
              Inputbox(title: "Solution", placeholder: 'Problem solving process / approach',minline: 3,controller: controllers.solution,editmode: editmode,),
              Row(
                spacing: 20,
                children: [
                  Expanded(child:Inputbox(title: "Tools", placeholder: 'Hardware and Software Used',controller: controllers.tools,editmode: editmode,),),
                  
                  Expanded(child: Inputbox(title: "Other Tools", placeholder: 'System/Tools/software Architecture (if applicable)',controller: controllers.othertools,editmode: editmode,))
                  ]
                  ),
              Inputbox(title: "Special remark", placeholder: 'Any Special things',controller: controllers.specialremark,editmode: editmode,),
              
              
               ],
            
          )
    );
        
  }
}