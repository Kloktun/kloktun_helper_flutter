import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loader extends StatefulWidget {

  Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();

}

class _LoaderState extends State<Loader> {



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.sp,
      child: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}