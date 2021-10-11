import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kloktun_helper/widgets/gap.dart';

class Label extends StatefulWidget {

  String? text;
  Widget? child;
  Widget? label;

  EdgeInsets? labelPadding;

  double? gap;

  Label({
    this.text,
    this.label,
    this.child,
    this.gap,
    this.labelPadding,
    Key? key
  }){

    assert(text != null || label != null);
    
  }

  @override
  _LabelState createState() => _LabelState();
}

class _LabelState extends State<Label> {
  Widget _buildLabelText(){

    var textStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyText1?.color,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500
    );

    if(widget.label != null){

      return DefaultTextStyle(
        style: textStyle,
        child: widget.label!
      );

    }

    return Text(
      widget.text!,
      style: textStyle
    );

  }

  Widget _buildLabel(){

    if(widget.labelPadding != null){

      return Padding(
        padding: widget.labelPadding!,
        child: _buildLabel(),
      );

    }

    return _buildLabelText();

  }

  @override
  Widget build(BuildContext context) {

    if(widget.child == null){
      return _buildLabel();
    }

    return Column(

      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        _buildLabel(),
        VGap(widget.gap ?? 10.sp),
        widget.child!

      ],

    );

  }
}