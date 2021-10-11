import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kloktun_helper/widgets/gap.dart';

class EmptyPlaceholder extends StatefulWidget {

  Widget label;
  Widget? description;

  Widget? image;

  IconData? icon;
  Color? iconColor;

  List<Widget>? actions;
  double? actionsGap;

  double? maxHeight;


  EmptyPlaceholder({
    Key? key,
    required this.label,
    this.description,
    this.image,
    this.icon,
    this.iconColor,
    this.actions,
    this.actionsGap,
    this.maxHeight

  }){


    assert(image != null || icon != null);

  }


  @override
  _EmptyPlaceholderState createState() => _EmptyPlaceholderState();
}

class _EmptyPlaceholderState extends State<EmptyPlaceholder> {

  bool get _hasDescription {

    return widget.description != null;

  }

  bool get _hasActions {

    return widget.actions != null && widget.actions!.length > 0;

  }

  Widget _buildImage(){


    Widget? child;

    if(widget.icon != null){

      child = Icon(widget.icon);    

    }

    if(widget.image != null){
      child = widget.image!;
    }

    return IconTheme(
      data: IconThemeData(
        color: widget.iconColor ?? Color(0xFFb4b4b4),
        size: 100.sp
      ),
      child: child!
    );


  }

  Widget _buildLabel(){

    TextStyle textStyle = TextStyle(
      fontSize: 13.sp,
      height: 1.4,
      color: Theme.of(context).textTheme.bodyText1?.color?.withAlpha(150),
      fontWeight: FontWeight.w500
    );

    return DefaultTextStyle(
      style: textStyle,
      textAlign: TextAlign.center,
      child: widget.label
    );

  }

  Widget _buildDescription(){

    TextStyle textStyle = TextStyle(
      fontSize: 13.sp,
      color: Theme.of(context).textTheme.bodyText2?.color?.withAlpha(110),
      height: 1.4,
    );

    return DefaultTextStyle(
      style: textStyle,
      textAlign: TextAlign.center,
      child: widget.description!
    );

  }

  List<Widget> _buildActions(){

    List<Widget> list = [];

    if(_hasActions){

      widget.actions!.forEach((element) {

        list.addAll([

          element,

          VGap(widget.actionsGap ?? 5.sp)

        ]);

      });

    }

    return list;

  }

  Widget _buildEmptyList(){

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25.sp),
      // height: widget.maxHeight ?? 0.4.sh,
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight ?? double.infinity
      ),
      child: Column(

        mainAxisSize: MainAxisSize.min,

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          _buildImage(),

          SizedBox(height: 25.sp),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: _buildLabel(),
          ),

          if(_hasDescription) SizedBox(height: 5.sp),

          if(_hasDescription) Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: _buildDescription(),
          ),

          SizedBox(height: 25.sp),

          if(_hasActions) ..._buildActions()

        ],
      )

    );

  }

  @override
  Widget build(BuildContext context) {
    return _buildEmptyList();
  }
}