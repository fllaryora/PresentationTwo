
import 'package:flutter/material.dart';
import 'package:presentationtwo/ui/feature_with_bloc/widgets/home.dart';

class BlocApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentation Two',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      //It adds the below code in order to use named routes
      routes: {
        '/': (context) => HomeBlocPage(title: 'Flutter Demo Home Page'),
      },
    );
  }
}

