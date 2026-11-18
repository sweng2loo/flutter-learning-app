import 'package:material_ui/material_ui.dart';

class Formcontrollers {

  final formkey = GlobalKey<FormState>();

  final taskNo = TextEditingController();
  final date = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  final responsibility = TextEditingController();
  final detail = TextEditingController();
  final problem = TextEditingController();
  final solution = TextEditingController();
  final tools = TextEditingController();
  final othertools = TextEditingController();
  final specialremark = TextEditingController();

  final taskNofocus = FocusNode();
  final datefocus = FocusNode();
  final titlefocus = FocusNode();




  bool cfnvalidateAndFocus(){
    final cvisvalid = formkey.currentState?.validate() ?? false;
    if (cvisvalid){return true;}

    if (validateInteger(taskNo.text) != null){
      // != null mean check whether it  returned the message'cant be emtpy/ must be number/ anything', 
      // if it return any message then it become true and  there is something wrong, then we will focus on it 
      taskNofocus.requestFocus();
    }else if(validateData(date.text) !=null ){
      datefocus.requestFocus();
      
    }else if(validateData(title.text) !=null){
      titlefocus.requestFocus();
    }
    return false;
    }



  void clearAll() {
    taskNo.clear();
    date.clear();
    title.clear();
    description.clear();
    responsibility.clear();
    detail.clear();
    problem.clear();
    solution.clear();
    tools.clear();
    othertools.clear();
    specialremark.clear();
  }


  void dispose(){
    taskNo.dispose();
    date.dispose();
    title.dispose();
    description.dispose();
    responsibility.dispose();
    detail.dispose();
    problem.dispose();
    solution.dispose();
    tools.dispose();
    othertools.dispose();
    specialremark.dispose();
    taskNofocus.dispose();
    datefocus.dispose();
    titlefocus.dispose();
  }

  String? validateData(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateInteger(String? value){
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty';}
  
  final number = int.tryParse(value);
  if(number == null ){
    return 'please enter a number';
  }

  if(number > 1000){
    return 'number too large';
  }
  return null;

}



}