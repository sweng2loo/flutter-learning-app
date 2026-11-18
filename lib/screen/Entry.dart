import 'package:logbook/helpers/my_flutter_app.dart';
import 'package:logbook/widget/formcpnt.dart';
import 'package:material_ui/material_ui.dart';


class Entry extends StatefulWidget {
  const new({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
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
                            children: [Row(mainAxisAlignment: MainAxisAlignment.center ,children: [Flexible(child: Text("New Entry",style: TextStyle(fontSize: 60, fontFamily: 'Times New Roman')),)]),
                              
                                      Formcomponent(),
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
                                            child: const Text('Save',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')),)
                                      ],)])
                          )),
                ])
              ],
          )
        )
      )
    );
  }
}