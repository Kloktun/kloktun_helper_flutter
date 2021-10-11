import 'package:example/screens/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:kloktun_helper/kloktun_helper.dart';
import 'package:kloktun_helper/widgets/empty_placeholder.dart';
import 'package:kloktun_helper/widgets/enter_code.dart';
import 'package:kloktun_helper/widgets/gap.dart';
import 'package:kloktun_helper/widgets/label.dart';
import 'package:kloktun_helper/widgets/list_tile.dart';
import 'package:kloktun_helper/widgets/list_tile_builder.dart';
import 'package:kloktun_helper/widgets/loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KloktunHelper(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Roboto",
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _open(Widget child, { String? title }){

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DemoPage(child: child, title: title,)));

  }

  _openTiles(){

    _open(

      KLListTileBuilder(items: [

        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsumipsumipsumipsuipsumipsumipsumipsumipsumipsumipsumipsumipsumipsum"),
          crossAxisAlignment: CrossAxisAlignment.start,
          notificationCount: 10,
          route: "123"
        ),
        
        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsumipsumipsumipsuipsumipsumipsumipsumipsumipsumipsumipsumipsumipsum"),
          notificationCount: 10,
          route: "123"
        ),

        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsumipsumipsumipsuipsumipsumipsumipsumipsumipsumipsumipsumipsumipsum"),
          crossAxisAlignment: CrossAxisAlignment.start,
          notificationCount: 10,
          hideChevron: true,
          route: "123"
        ),
        
        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsumipsumipsumipsuipsumipsumipsumipsumipsumipsumipsumipsumipsumipsum"),
          notificationCount: 10,
          hideChevron: true,
          route: "123"
        ),

        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsumipsumipsumipsuipsumipsumipsumipsumipsumipsumipsumipsumipsumipsum"),
          trailing: Checkbox(value: true, onChanged: (val){},),
          // crossAxisAlignment: CrossAxisAlignment.start,
          route: "123"
        ),

        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsum ipsum"),
          // crossAxisAlignment: CrossAxisAlignment.start,
          route: "123"
        ),

        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          subtitle: Text("Lorem ipsum ipsum"),
          // crossAxisAlignment: CrossAxisAlignment.start,
        ),

        KLListTileItem(
          icon: Icons.ac_unit,
          title: Text("123"),
          // crossAxisAlignment: CrossAxisAlignment.start,
        ),

         KLListTileItem(
          title: Text("123"),
          // crossAxisAlignment: CrossAxisAlignment.start,
        ),

      ]),
      
    );

  }

  _showEnterCode() async {

    var value = await showEnterCodeModal(context: context);

    print(value ?? "error");

  }

  _openEmptyPlaceholder(){

    _open(
      Column(
        children: [
          EmptyPlaceholder(
            icon: Icons.ac_unit,
            label: Text("Ничего не найдено"),
            description: Text("Но можете посмотреть на красивую снежинку, я думаю, что она Вам понравится"),
            actions: [
              ElevatedButton(onPressed: (){}, child: Text("text")),
              TextButton(onPressed: (){}, child: Text("text")),
              Text("123")
            ]
          )
        ]
      )
    );

  }

  _openLabel(){

    _open(
      Column(
        children: [
          Label(
            label: Text("Some label"),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
          )
        ]
      )
    );

  }


  _openLoader(){

    _open(
      Column(
        children: [
          Loader()
        ]
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            ElevatedButton(onPressed: _openTiles, child: Text("List Tiles")),
            VGap(20),
            ElevatedButton(onPressed: _showEnterCode, child: Text("Enter Code")),
            VGap(20),
            ElevatedButton(onPressed: _openEmptyPlaceholder, child: Text("Placeholder")),
            VGap(20),
            ElevatedButton(onPressed: _openLabel, child: Text("Label")),
            VGap(20),
            ElevatedButton(onPressed: _openLoader, child: Text("Loader")),


          ],
        ),
      )
    );
  }
}
