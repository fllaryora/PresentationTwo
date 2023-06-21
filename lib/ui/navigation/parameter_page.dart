
import 'package:flutter/material.dart';

//sometimes people use just a Map class
class ScreenArguments {
  final String title;
  final String message;
  ScreenArguments(this.title, this.message);
}

class ParameterPage extends StatefulWidget {
  ParameterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ParameterPageState createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {
  String _title = "";
  String _message = "";

  void _setData(String newTitle, String newMessage) {
    setState(() {
      _title = newTitle;
      _message = newMessage;
    });
  }

  @override
  void initState () {
    //If you are writing this method from scratch
    //you would add the following line to quit the warning!
    super.initState();
    //getting the argument
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      _setData(args.title, args.message);
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
              child: Text('Go Back To Home screen without Return any value'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            Text(
              '$_title',
            ),
            Text(
              '$_message',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}