import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', name: 'Gg'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.name});

  final String title;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> userCom = {"name": "John Smith", "email": "john@example.com"};
    
    // Put [] and then {"name": "John Smith", "email": "john@example.com"}
    //var user = json.decode('[{"name": "John Smith", "email": "john@example.com"}]');
    Map<String, dynamic> user = json.decode('{"name": "John Smith", "email": "john@example.com"}');

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Text(
          widget.name + " " + "Howdy," + " " + "${user['name']}" + "\n" + "We sent the verification link to ${user['email']}.",
          style: Theme.of(context).textTheme.display1,
        ));
  }
}
