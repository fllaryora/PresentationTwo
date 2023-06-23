import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentationtwo/ui/feature_with_bloc/app.dart';
import 'package:presentationtwo/ui/feature_with_bloc/observer.dart';

///import 'package:presentationtwo/ui/get_x_state_management/app.dart';
///import 'package:presentationtwo/ui/navigation/app.dart';
///import 'package:presentationtwo/ui/provider_example/app.dart';
///import 'package:presentationtwo/ui/provider_example/main_model.dart';

///import 'package:provider/provider.dart';

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

  // OK
  //runApp(GetXApp());

  Bloc.observer = CounterBlocObserver();
  runApp(BlocApp());
}


