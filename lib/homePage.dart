import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.name}) : super(key: key);
  final String name;

  @override
  State<HomePage> createState() => _HomePageState(name);
}

class _HomePageState extends State<HomePage> {
  String name;
  _HomePageState(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to home page $name",style:TextStyle(fontSize: 20),),
      ),
    );
  }
}
