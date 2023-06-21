
import 'package:flutter/material.dart';

class ReturnerPage extends StatefulWidget {
  ReturnerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ParameterPageState createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ReturnerPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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
            ElevatedButton(
              child: Text('Go Back To screen with returned value'),
              onPressed: (){
                Navigator.of(context).pop('$_counter');
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}