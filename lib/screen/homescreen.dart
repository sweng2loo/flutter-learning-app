import 'package:logbook/screen/entry.dart';
import 'package:logbook/screen/records.dart';
import 'package:material_ui/material_ui.dart';
import 'package:logbook/helpers/my_flutter_app.dart';

class Homescreen extends StatelessWidget {
  const new({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color.fromARGB(157, 39, 39, 39),
        body: Center(child:Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(
        MyFlutterApp.homelogo, 
        size: 300,
        color: Colors.amber,),
        const SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Entry()));
            }, 
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 50),
              backgroundColor :Colors.orange),
            child: const Text('New record',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')),),
            SizedBox(width: 24),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Records()));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 50),
              backgroundColor: Colors.orange  
              ),
            child: const Text('Records',style: TextStyle(color:  Colors.white,fontSize: 30, fontFamily: 'Times New Roman')
            )
            )
            ],)
            ] 
      ),
      ),
      );
  }
}