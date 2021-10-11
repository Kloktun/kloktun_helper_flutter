import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {

  String? title;
  Widget child;

  DemoPage({Key? key, required this.child, this.title}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: widget.title != null ? Text(widget.title!) : null,
      ),

      body: SingleChildScrollView(

        child: Container(

          child: widget.child

        ),

      ),


    );
  }
}