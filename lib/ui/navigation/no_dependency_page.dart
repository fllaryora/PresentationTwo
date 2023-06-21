import 'package:flutter/material.dart';

class NoDependencyPage extends StatefulWidget {
  NoDependencyPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NoDependencyPageState createState() => _NoDependencyPageState();
}

class _NoDependencyPageState extends State<NoDependencyPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "This page doesn't receive any parameter",
            ),
            ElevatedButton(
              child: Text('Go Back To Home screen without Return any value'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}