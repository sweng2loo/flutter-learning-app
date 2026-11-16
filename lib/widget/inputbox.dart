import 'package:material_ui/material_ui.dart';


class Inputbox extends StatelessWidget {
  final String title;
  final String placeholder;
  final int minline;
  

  
  const new({super.key,
  required this.title,
  required this.placeholder,
  this.minline = 1});
  

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
          SizedBox(width: 100,
          child: Padding(padding: EdgeInsetsGeometry.only(top:13),
            child:Text(title, style: TextStyle(color: Colors.black), overflow: TextOverflow.ellipsis,)),
            ),
         SizedBox(width: 10, 
          child:Padding(padding: EdgeInsetsGeometry.only(top: 13),child: Text(':'),)
            ),
        Expanded(
           
            child: TextFormField(
              minLines: minline,
              maxLines: null,
            decoration: InputDecoration(alignLabelWithHint: true,
              labelText: placeholder, border: OutlineInputBorder(),focusColor: Colors.amber,),
            cursorColor:Colors.amberAccent)
              )
        ],
      );
    }
  }