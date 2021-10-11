import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KLListTile extends StatefulWidget {

  Widget title;
  Widget? subtitle;

  Widget? leading;
  Widget? trailing;

  IconData? icon;
  Color? iconColor;

  bool hideChevron;
  bool hideDivider;

  double? notificationCount;
  Color? notificationColor;
  Color? notificationForegroundColor;

  CrossAxisAlignment? crossAxisAlignment;

  Function()? onTap;

  KLListTile({
    
    Key? key,
    
    required this.title,
    this.subtitle,

    this.leading,
    this.trailing,

    
    
    this.hideDivider = false,
    this.hideChevron  = false,
    this.icon,
    this.iconColor,
    this.notificationCount,
    this.onTap,
    this.crossAxisAlignment

  }) : super(key: key);

  @override
  _KLListTileState createState() => _KLListTileState();
}

class _KLListTileState extends State<KLListTile> {

  double _gap = 15.sp;

  bool get _hasNotifications {

    return widget.notificationCount != null && widget.notificationCount != 0;

  }

  bool get _showChevron {

    return widget.onTap != null && !widget.hideChevron;

  }

  bool get _hasLeading {

    return widget.leading != null || widget.icon != null;

  }

  bool get _hasTrailing {
    
    return widget.trailing != null || _hasNotifications || _showChevron;

  }

  Widget _buildTitle(){

    TextStyle textStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyText1?.color
    );

    return DefaultTextStyle(
      style: textStyle,
      child: widget.title,
    );

  }

  Widget _buildSubtitle(){

    if(widget.subtitle == null){
      return Container();
    }

    TextStyle textStyle = TextStyle(
      fontSize: 12.sp,
      color: Theme.of(context).textTheme.bodyText2?.color
    );

    return DefaultTextStyle(
      style: textStyle,
      child: widget.subtitle!,
    );

  }

  Widget _buildContent(){

    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          if(widget.subtitle != null) SizedBox(height: 5.sp),
          if(widget.subtitle != null) _buildSubtitle(),
        ]
      )
    );

  }

  Widget _buildDivider(){

    return const Divider(height: 0);

  }

  Widget _buildLeading(){

    Widget? leading;

    if(widget.icon != null){

      leading = Icon(widget.icon);

    }

    if(widget.leading != null){

      leading = widget.leading;

    }

    if(leading == null){
      return Container();
    }

    var brightness = Theme.of(context).brightness;

    var iconColor = widget.iconColor ?? (brightness == Brightness.dark ? Colors.white : Theme.of(context).primaryColor);

    return Container(
      width: 20.sp,
      height: 20.sp,
      alignment: Alignment.center,
      child: IconTheme(

        data: Theme.of(context).iconTheme.copyWith(
          color: iconColor,
          size: 19.sp
        ),

        child: leading

      )
    );

  }

  Widget _buildTrailing(){

    Widget? trailing;

    if(_showChevron){

      trailing = _buildChevron();

    }

    if(widget.trailing != null){

      trailing = widget.trailing!;

    }

    
    if(_hasNotifications && trailing == null){

      return _buildNotificationsCount();

    }

    if(_hasNotifications){

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          _buildNotificationsCount(),

          if(trailing != null) SizedBox(width: 20.sp),

          if(trailing != null ) trailing

        ]
      );

    }

    if(trailing == null){
      return Container();
    }

    return  trailing;

  }


  Widget _buildChevron(){

    var chevron = FaIcon(
      FontAwesomeIcons.chevronRight,
      color: Color(0x80808080),
      size: 14.sp
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: _gap / 2),
      child: chevron
    );


  }

  Widget _buildNotificationsCount(){

    return Container(
      width: 14.sp,
      height: 14.sp,
      child: OverflowBox(
        maxWidth: 40.sp,
        maxHeight: 40.sp,
        child: Badge(
          elevation: 0,
          animationType: BadgeAnimationType.scale,
          badgeColor: widget.notificationColor ?? Colors.red,
          toAnimate: false,
          badgeContent: Text(widget.notificationCount!.toInt().toString(), style: TextStyle(color: widget.notificationForegroundColor ?? Colors.white)),
        )
      ),
    );

  }



  Widget _buildRow(){

  
    return Row(

      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,

      children: [

        if(_hasLeading) _buildLeading(),

        if(_hasLeading) SizedBox(width: _gap),

        _buildContent(),

        if(_hasTrailing) Container(
          margin: EdgeInsets.symmetric(horizontal: _gap),
          child: _buildTrailing()
        ),


      ],

    );


  }

  Widget _buildItem(){

    return Column(

      mainAxisSize: MainAxisSize.min,

      children: [

        SizedBox(height: _gap * 1.2),

        _buildRow(),
        
        SizedBox(height: _gap * 1.2),

        if(!widget.hideDivider) _buildDivider()

      ],

    );

  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      
      onTap: widget.onTap,

      child: Container(
        padding: EdgeInsets.only(left: _gap),
        child: _buildItem()
      ),
    );
    
  }
}