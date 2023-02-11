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
      appBar: AppBar(title: Text("Home"),
      leading: IconButton(onPressed: (){setState(() {
        Navigator.pop(context);
      });},
      icon: Icon(Icons.arrow_back_ios)),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to home page",style:TextStyle(fontSize: 20),),
            Text("$name",style:TextStyle(fontSize: 20),),

          ],
        ),
      ),
    );
  }
}
