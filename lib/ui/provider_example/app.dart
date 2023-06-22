import 'package:flutter/material.dart';
import 'package:presentationtwo/ui/provider_example/home_page.dart';

class ProviderApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentation Two',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeProviderPage(title: 'Flutter Demo Home Page'),
    );
  }
}