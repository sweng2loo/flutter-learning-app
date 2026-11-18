import 'package:logbook/helpers/formcontrollers.dart';
import 'package:logbook/helpers/my_flutter_app.dart';
import 'package:logbook/model/taskrecord.dart';
import 'package:logbook/screen/entry.dart';
import 'package:logbook/services/database_services.dart';

import 'package:logbook/widget/formcpnt.dart';

import 'package:material_ui/material_ui.dart';


class Records extends StatefulWidget {
  const new({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final _recordformcontrollers = Formcontrollers();
  final _database = DatabaseServices.useDatabase;
  

  List<TaskRecord> _records = [];
  int _currentIndex = 0;
  bool editmode = false;

  @override 
  void initState(){
    super.initState();
    _cfnloadfromDatabase();
  
  }

  Future<void> _cfnloadfromDatabase() async{
    final data = await _database.cfnloadTasks();

    setState(() {
      _records =  data;
      if (_records.isNotEmpty){ 
        if( _currentIndex >= _records.length){
          _currentIndex = 0;
        }
        _recordformcontrollers.cfnloadfromDatabase(_records[_currentIndex]);}
        else{_currentIndex = 0;}
      }
    );

  }


  void cfnnextRecord(){
      if (_currentIndex < _records.length - 1 ){
        setState(() {
        _currentIndex++;
        _recordformcontrollers.cfnloadfromDatabase(_records[_currentIndex]);
      });
      }
  }
  void cfnpreviousRecord(){
    if (_currentIndex > 0){
        setState(() {
        _currentIndex--;
        _recordformcontrollers.cfnloadfromDatabase(_records[_currentIndex]);
      });
      }

  }

  Future<void> _cfndeleterecord() async {
    if(_records.isEmpty || _records[_currentIndex].id == null){
      return;
    }
    final selectedtask = _records[_currentIndex];
    final bool? confirmation = await showDialog<bool>(
      context: context, 
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Delete Record"),
          content: Text("Are you sure want to delete this record?"),
          actions: [TextButton(onPressed: () => Navigator.of(dialogContext).pop(false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.of(dialogContext).pop(true), child: const Text('Sure Delete'))
                    ],    
                  );
                 }   
                );
    if (confirmation == true){
      await _database.cfndeleteTask(selectedtask.id!);
      if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Record deleted!')),
        );
      
    }
      setState(() {
          if (_currentIndex > 0 && _currentIndex >= _records.length - 1) 
          {_currentIndex--;}
          }
            );
    await _cfnloadfromDatabase();
  }


  Future<void> cfnUpdate() async{

    if(_recordformcontrollers.cfnvalidateAndFocus()){

    final selectedtask = _records[_currentIndex].id;
    final updatedrecord = TaskRecord(
        id: selectedtask,
        taskNo: int.parse(_recordformcontrollers.taskNo.text),
        date: _recordformcontrollers.date.text, 
        title: _recordformcontrollers.title.text,
        description: _recordformcontrollers.description.text,
        responsibility: _recordformcontrollers.responsibility.text,
        detail: _recordformcontrollers.detail.text,
        problem: _recordformcontrollers.problem.text,
        solution: _recordformcontrollers.solution.text,
        tools: _recordformcontrollers.tools.text,
        othertools: _recordformcontrollers.othertools.text,
        specialRemark: _recordformcontrollers.specialremark.text,
       );

    try{
        await _database.cfnupdateTask(updatedrecord);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task updated!')),
        );
        setState(() {
          editmode =false;
        });
        await _cfnloadfromDatabase();
        } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save task: $e')),
            );
            }
    
    }
  }


  @override
  void dispose() {
    _recordformcontrollers.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 56, 55), 
      body:Padding(
        padding: EdgeInsetsGeometry.all(30),
        child:SingleChildScrollView( 
        scrollDirection: Axis.vertical,
          child:Stack(children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [ 
              Icon(
                MyFlutterApp.homelogo, 
                size: 180,
                color: Colors.amber,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                IconButton(splashColor:Colors.amber,iconSize:70, onPressed: (!editmode && _currentIndex > 0) ? cfnpreviousRecord: null, icon:  Icon(Icons.arrow_back_ios_outlined),style:IconButton.styleFrom(backgroundColor: Colors.amber)),
                SingleChildScrollView(scrollDirection:Axis.horizontal,
                    child:Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      padding: EdgeInsets.all(50),
                      margin: EdgeInsets.fromLTRB(0, 70 , 0, 70),
                      decoration: 
                        BoxDecoration(
                          color: Colors.white,
                          boxShadow:[
                            BoxShadow(color: Colors.black,  // shadow color
                              blurRadius: 8,        // how soft/blurry
                              spreadRadius: 2,      // how far it extends beyond the box
                              offset: const Offset(0, 4),)],
                          borderRadius: BorderRadius.all(Radius.circular(20)) ),
                          child:Column(
                            spacing: 50,
                            children: [Row(mainAxisAlignment: MainAxisAlignment.center ,children: [Flexible(child: Text("Records",style: TextStyle(fontSize: 60, fontFamily: 'Times New Roman')),)]),
                                       
                                       IgnorePointer(ignoring: editmode,child: Opacity(opacity: editmode ? 0.5 : 1.0, child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                        IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Entry()));},iconSize: 40,icon:Icon(Icons.add, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.amber,fixedSize: Size(70, 70)),),
                                        IconButton(onPressed:  _cfnloadfromDatabase,iconSize: 40,icon:Icon(Icons.refresh, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.green,fixedSize: Size(70, 70)),),
                                        IconButton(onPressed: () {setState(() {editmode = true;});},iconSize: 40,icon:Icon(Icons.edit, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.blue,fixedSize: Size(70, 70)),),
                                        IconButton(onPressed:  _cfndeleterecord,iconSize: 40,icon:Icon(Icons.delete, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.red,fixedSize: Size(70, 70)),)
                                       ],) ,),),
                                       
                              
                                      Formcomponent(controllers: _recordformcontrollers,editmode: editmode,),
                                      SizedBox(child: Text('${_currentIndex + 1} of ${_records.length} Records', style:const TextStyle(fontFamily: 'Times New Roman',fontSize: 20))),
                                      if(editmode)
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        ElevatedButton(onPressed: editmode ? () {setState(() {editmode = false; _cfnloadfromDatabase();});} : null ,
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(200, 50),
                                            backgroundColor :Colors.orange),
                                          child: const Text('Cancel',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')),),                                        
                                        ElevatedButton(onPressed: editmode ? (){cfnUpdate();} : null,
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(200, 50),
                                              backgroundColor :Colors.orange),
                                            child: const Text('Submit',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')),)
                                      ],)])
                          )),
                IconButton(splashColor:Colors.amber,iconSize:70, onPressed: (!editmode && _currentIndex < _records.length - 1) ? cfnnextRecord: null, icon:  Icon(Icons.arrow_forward_ios_outlined),style:IconButton.styleFrom(backgroundColor: Colors.amber))
                
                ])
              ],),
              if(!editmode)
              Positioned(top:100,right:100, child:IconButton(onPressed: () {Navigator.pop(context);},iconSize: 20,icon:Icon(Icons.close, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.red,fixedSize: Size(40, 40)),))
          ])
          ),  
      )
    );
  }
}