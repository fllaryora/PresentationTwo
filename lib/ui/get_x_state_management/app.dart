import 'package:flutter/material.dart';
import 'package:presentationtwo/ui/get_x_state_management/first/first_screen.dart';
import 'package:presentationtwo/ui/get_x_state_management/my_translations.dart';
import 'package:presentationtwo/ui/get_x_state_management/second/second_screen.dart';
import 'package:presentationtwo/ui/get_x_state_management/third/third_screen.dart';
import 'package:get/get.dart';
import 'package:presentationtwo/ui/get_x_state_management/simple_bind.dart';
import 'package:presentationtwo/ui/get_x_state_management/transitions.dart';

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