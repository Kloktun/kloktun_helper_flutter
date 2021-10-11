import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconLabel extends StatefulWidget {

  Widget label;
  IconData? iconData;
  Color? iconColor;
  double? iconSize;
  Widget? icon;

  IconLabel({
    Key? key,
    required this.label,
    this.iconData,
    this.iconColor,
    this.iconSize,
    this.icon
  }) : super(key: key);

  @override
  _IconLabelState createState() => _IconLabelState();
}

class _IconLabelState extends State<IconLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisSize: MainAxisSize.min,

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        widget.iconData != null ? Icon(
          widget.iconData,
          color: widget.iconColor ?? Color(0x80808080),
          size: widget.iconSize ?? 20.sp
        ) : widget.icon ?? Icon(Icons.circle, color: widget.iconColor ?? Color(0x80808080),),

        SizedBox(width: 10.sp),

        DefaultTextStyle(

          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp
          ),

          child: Flexible(
            child: widget.label
          )
        )


      ],

    );
  }
}