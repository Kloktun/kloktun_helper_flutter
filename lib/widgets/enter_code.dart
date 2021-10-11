import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> showEnterCodeModal({
  
  required BuildContext context,
  String? title,
  String? description,

}) async {

  String code = await showModalBottomSheet(
    
    context: context,

    isScrollControlled: true,

    builder: (context){
      return EnterCode(
        title: title,
        description: description,
      );
    }
  );

  return code;

}

class EnterCode extends StatefulWidget {

  String? title;
  String? description;

  EnterCode({
    Key? key,
    this.title,
    this.description
  }) : super(key: key);

  @override
  _EnterCodeState createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {

  late TextEditingController _textEditingController;

  @override
  void initState() { 
    super.initState();
    
    _textEditingController = TextEditingController();

  }

  _submit(){

    var value = _textEditingController.text;

    if(value.length == 0){
      Navigator.of(context).pop();
      return;
    }

    Navigator.of(context).pop(value);

  }


  Widget _buildForm(){

    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      mainAxisSize: MainAxisSize.min,

      children: [

        Text(widget.title ?? "Код из сообщения",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500
          )
        ),

        SizedBox(height: 15.sp),

        Text(widget.description ?? "На Ваш номер телефона было отправлено SMS сообщение с кодом. Пожалуйста, введите код из сообщения", 
          style: TextStyle(
            fontSize: 14.sp,
          )
        ),

        SizedBox(height: 20.sp),

        TextField(

          controller: _textEditingController,

          autofocus: true,

          keyboardType: TextInputType.number,

          onSubmitted: (value){

            _submit();

          },
          
          decoration: InputDecoration(
              // prefixIcon: Icon(Icons.messenger),
              labelText: "Код из сообщения",
              hintText: "1234",
              border: OutlineInputBorder(),
            ),

        ),

        SizedBox(height: 15.sp),

        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){

              _submit();

            },
            child: Text("Отправить код")
          )
        ),

        Container(
          height: MediaQuery.of(context).viewInsets.bottom,
        )
      ],

    );

  }
  
  @override
  Widget build(BuildContext context) {

    double paddingBottom = MediaQuery.of(context).padding.bottom;

    return Container(

      padding: EdgeInsets.all(15.sp).copyWith(bottom: paddingBottom + 15.sp),
      child: _buildForm(),

    );
  }
}