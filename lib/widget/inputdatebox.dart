import 'package:material_ui/material_ui.dart';


class InputDateBox extends StatefulWidget {
  final String title;


  const new({super.key,
  required this.title,
});

  @override
  State<InputDateBox> createState() => _InputDateBoxState();
}

class _InputDateBoxState extends State<InputDateBox> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate){
      
        _selectedDate = picked;
        _dateController.text = "${picked.year}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
      ;
    }
  }


  @override
  Widget build(BuildContext context) {
    return 
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [

          SizedBox(
          width: 100, 
          child: Padding(padding: EdgeInsetsGeometry.only(top:13),
            child:Text(widget.title, style: TextStyle(color: Colors.black), overflow: TextOverflow.ellipsis,)),
            ),
          SizedBox(width: 10, 
          child:Padding(padding: EdgeInsetsGeometry.only(top: 13),child: Text(':'),)
            ),
        Expanded(
            child: TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _pickDate(context),

            decoration: InputDecoration(alignLabelWithHint: true,
              hintText: 'YYYY-MM-DD', border: OutlineInputBorder(),focusColor: Colors.amber,),
            cursorColor:Colors.amberAccent)
              )
        ],
      );
    }
}