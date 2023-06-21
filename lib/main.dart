import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentationtwo/ui/get_x_state_management/first/first_screen.dart';
import 'package:presentationtwo/ui/get_x_state_management/my_translations.dart';
import 'package:presentationtwo/ui/get_x_state_management/second/second_screen.dart';
import 'package:presentationtwo/ui/get_x_state_management/simple_bind.dart';
import 'package:presentationtwo/ui/get_x_state_management/third/third_screen.dart';
import 'package:presentationtwo/ui/get_x_state_management/transitions.dart';
import 'package:presentationtwo/ui/home_page_navigation.dart';
import 'package:presentationtwo/ui/navigation/no_dependency_page.dart';
import 'package:presentationtwo/ui/navigation/parameter_page.dart';
import 'package:presentationtwo/ui/navigation/return_page.dart';
import 'package:presentationtwo/ui/provider_example/home_page.dart';
import 'package:presentationtwo/ui/provider_example/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  //OK
  //runApp(MyApp());

  //OK
  /*runApp(
      MultiProvider(
        child: ProviderApp(),
        providers: [
          ChangeNotifierProvider(
              create: (_) => MainModel()
          )
        ],
    )
  );*/

  runApp(GetXApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentation Two',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //It adds the below code in order to use named routes
      routes: {
        //Can not contains the key / or it would be redundant.
        //'/': (context) => HomeNavigationPage(title: 'Flutter Demo Home Page'),
        '/noDependency': (context) =>
            NoDependencyPage(title: 'Page without any dependency'),
        '/withParameter': (context) =>
            ParameterPage(title: 'Page has a parameter'),
        '/withReturn': (context) =>
        ReturnerPage(title: 'Page has a return'),
      },
      home: HomeNavigationPage(title: 'Flutter Demo Home Page'),
    );
  }
}

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

class GetXApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      title: 'Presentation Two',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: Locale('pt', 'BR'),
      //It adds the below code in order to use named routes
      getPages: [
        //Simple GetPage
        GetPage(name: '/home', page: () => First()),
        // GetPage with custom transitions and bindings
        GetPage(
          name: '/second',
          page: () => Second(),
          customTransition: SizeTransitions(),
          binding: SampleBind(),
        ),
        // GetPage with default transitions
        GetPage(
          name: '/third',
          transition: Transition.cupertino,
          page: () => Third(),
        ),
      ],
    );
  }
}
