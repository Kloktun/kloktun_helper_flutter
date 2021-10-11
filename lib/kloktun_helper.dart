library kloktun_helper;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KloktunHelper extends StatelessWidget {

  Widget child;

  KloktunHelper({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (){
        
        return child;

      }
    );
  }
}