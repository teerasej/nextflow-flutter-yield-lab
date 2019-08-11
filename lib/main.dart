import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _start() {
  }

  Stream<int> asynchronousNaturalsTo(int n) async* {
    int k = 0;
    while (k < n) {
      await Future.delayed(Duration(seconds: 1));
      print("going to push stream");
      yield k++;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
            stream: asynchronousNaturalsTo(10),
            builder: (context, snapshot) {
              return Text(snapshot.data.toString()
              , style: TextStyle(fontSize: 60.0),);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _start,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
