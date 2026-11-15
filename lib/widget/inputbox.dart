import 'package:material_ui/material_ui.dart';


class Inputbox extends StatelessWidget {
  final String title;
  final String placeholder;
  

  
  const new({super.key,
  required this.title,
  required this.placeholder});
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child:
          Text(title, style: TextStyle(color: Colors.black), overflow: TextOverflow.ellipsis,),),
         SizedBox(width: 10, child:
          Text(':')),
        Expanded(
            child: TextFormField(
            decoration: InputDecoration(
              labelText: placeholder, border: OutlineInputBorder(),focusColor: Colors.amber),
            cursorColor:Colors.amberAccent)
              )
        ],
      );
    }
  }