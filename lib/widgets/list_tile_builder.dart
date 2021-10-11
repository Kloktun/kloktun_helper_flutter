import 'package:flutter/material.dart';

import 'list_tile.dart';

class KLListTileItem {

  Widget title;
  Widget? subtitle;

  Widget? leading;
  Widget? trailing;

  IconData? icon;
  Color? iconColor;

  bool hideChevron;
  bool hideDivider;

  double? notificationCount;

  CrossAxisAlignment? crossAxisAlignment;

  String? route;
  dynamic routeProps;

  Function()? onTap;

  KLListTileItem({
    
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
    this.crossAxisAlignment,

    this.route,
    this.routeProps,

  });

}

class KLListTileBuilder extends StatefulWidget {

  List<KLListTileItem> items;

  KLListTileBuilder({
    Key? key,
    required this.items
  }) : super(key: key);

  @override
  _KLListTileBuilderState createState() => _KLListTileBuilderState();
}

class _KLListTileBuilderState extends State<KLListTileBuilder> {

  Widget _buildListTile(KLListTileItem item){

    return KLListTile(
      
      title: item.title,
      subtitle: item.subtitle,

      leading: item.leading,
      trailing: item.trailing,

      hideDivider: item.hideDivider,
      hideChevron: item.hideChevron,
      icon: item.icon,
      iconColor: item.iconColor,
      notificationCount: item.notificationCount,
      crossAxisAlignment: item.crossAxisAlignment,
      onTap: item.onTap ?? (
        item.route != null ? (){

          Navigator.of(context).pushNamed(item.route!, arguments: item.routeProps);

        } : null
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisSize: MainAxisSize.min,

      children: widget.items.map((e) => _buildListTile(e)).toList()

    );
  }
}