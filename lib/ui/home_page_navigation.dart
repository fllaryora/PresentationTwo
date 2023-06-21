import 'package:flutter/material.dart';
import 'package:presentationtwo/ui/navigation/no_dependency_page.dart';
import 'package:presentationtwo/ui/navigation/parameter_page.dart';

class HomeNavigationPage extends StatefulWidget {
  HomeNavigationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeNavigationPageState createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
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
              child: Text(
                  'Go To screen without parameters and without named Route'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        NoDependencyPage(title: 'Page without any dependency'),
                  ),
                );
              },
            ),

            ElevatedButton(
              child: Text(
                  'Go To screen without parameters and with named Route'),
              onPressed: (){
                Navigator.of(context).pushNamed('/noDependency');
              },
            ),

            ElevatedButton(
              child: Text('Go To screen with parameters and with named Route'),
              onPressed: (){
                Navigator.of(context).pushNamed('/withParameter',
                    arguments: ScreenArguments('times', '$_counter'));
              },
            ),
            ElevatedButton(
              child: Text('Go To screen with returned value'),
              onPressed: () async {
                final result  = await Navigator.of(context)
                    .pushNamed('/withReturn');
                // When a BuildContext is used from a StatefulWidget,
                // the mounted property
                // must be checked after an asynchronous gap.
                if (!mounted) return;
                if(result is String ) {
                  /**
                   * You can use the "double dot" to call functions
                   * on objects and access properties.
                   * This "operator" is simply used to make your code cleaner
                   * and concise.
                   * It often saves you from having to create temporary variables.
                   */
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('$result')));
                }

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
      ),
    );
  }
}
