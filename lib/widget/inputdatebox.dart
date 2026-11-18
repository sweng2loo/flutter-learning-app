import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';


class InputDateBox extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? valid;
  final FocusNode? cvfocusNode;
  final bool editmode;
  


  const new({super.key,
  required this.title,
  required this.controller,
  this.valid,
  this.cvfocusNode,
  this.editmode = true
});

  @override
  State<InputDateBox> createState() => _InputDateBoxState();
}

class _InputDateBoxState extends State<InputDateBox> {
  
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate){
      
        _selectedDate = picked;
        widget.controller.text = "${picked.year}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
      
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
              controller: widget.controller,
              validator:  widget.valid,
              focusNode: widget.cvfocusNode,
              keyboardType: TextInputType.none,
              showCursor: false,
              readOnly: !widget.editmode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'.*')), // Blocks physical keyboard typing
              ],
              canRequestFocus: true,
              onTap: widget.editmode ? () => _pickDate(context) : null,

            decoration: InputDecoration(alignLabelWithHint: true,
              hintText: 'YYYY-MM-DD', border: OutlineInputBorder(),focusColor: Colors.amber,filled: !widget.editmode, fillColor: widget.editmode ? null : Colors.grey.shade200,),
            cursorColor:Colors.amberAccent)
              )
        ],
      );
    }
}