import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlainButton extends StatefulWidget {

  late Function()? onPressed = (){};
  late Widget? child;

  EdgeInsets? padding;

  PlainButton({
    Key? key,
    this.onPressed,
    this.child,
    this.padding
  });

  static PlainButton icon({
    required String label,
    required Icon icon,
    Function()? onPressed,
    EdgeInsets? padding

  }){


    return PlainButton(

      onPressed: onPressed,
      padding: padding,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          icon,

          SizedBox(width: 15.sp),

          Flexible(
            child: Text(label)
          )

        ],
      ),

    );

  }

  @override
  _PlainButtonState createState() => _PlainButtonState();
}

class _PlainButtonState extends State<PlainButton> {



  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorLight),
        foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        padding: widget.padding != null ? MaterialStateProperty.all(widget.padding!) : null
      ),
      onPressed: widget.onPressed,
      child: widget.child
    );
  }
}