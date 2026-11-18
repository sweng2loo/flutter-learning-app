import 'package:logbook/helpers/formcontrollers.dart';
import 'package:logbook/helpers/my_flutter_app.dart';

import 'package:logbook/widget/formcpnt.dart';

import 'package:material_ui/material_ui.dart';

class Records extends StatefulWidget {
  const new({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final _recordformcontrollers = Formcontrollers();

  
  
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
                IconButton(splashColor:Colors.amber,iconSize:70, onPressed: () {}, icon:  Icon(Icons.arrow_back_ios_outlined),style:IconButton.styleFrom(backgroundColor: Colors.amber)),
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
                                       Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                        IconButton(onPressed: () {},iconSize: 40,icon:Icon(Icons.add, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.amber,fixedSize: Size(70, 70)),),
                                        IconButton(onPressed: () {},iconSize: 40,icon:Icon(Icons.refresh, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.green,fixedSize: Size(70, 70)),),
                                        IconButton(onPressed: () {},iconSize: 40,icon:Icon(Icons.edit, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.blue,fixedSize: Size(70, 70)),),
                                        IconButton(onPressed: () {},iconSize: 40,icon:Icon(Icons.delete, color: Colors.white),style: IconButton.styleFrom(backgroundColor: Colors.red,fixedSize: Size(70, 70)),)
                                       ],), 
                              
                                      Formcomponent(controllers: _recordformcontrollers,),
                                      SizedBox(child: Text('?? of ?? Records'),),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        ElevatedButton(onPressed: () {}, 
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(200, 50),
                                            backgroundColor :Colors.orange),
                                          child: const Text('Cancel',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')),),                                        
                                        ElevatedButton(onPressed: () {}, 
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(200, 50),
                                              backgroundColor :Colors.orange),
                                            child: const Text('Submit',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')),)
                                      ],)])
                          )),
                IconButton(splashColor:Colors.amber,iconSize:70, onPressed: () {}, icon:  Icon(Icons.arrow_forward_ios_outlined),style:IconButton.styleFrom(backgroundColor: Colors.amber))
                
                ])
              ],
          )
        )
      )
    );
  }
}