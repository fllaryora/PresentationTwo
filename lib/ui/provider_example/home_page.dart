import 'package:flutter/material.dart';
import 'package:presentationtwo/ui/provider_example/main_model.dart';
import 'package:provider/provider.dart';

class HomeProviderPage extends StatefulWidget {
  HomeProviderPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeProviderPage> {

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
              'You have pushed the button this many times:',
            ),
            Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<MainModel>().increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<MainModel>().counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
