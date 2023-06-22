import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_bloc.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_event.dart';
import 'package:presentationtwo/ui/feature_with_bloc/repository/counter_repository.dart';
import 'package:presentationtwo/ui/feature_with_bloc/widgets/counter_body.dart';

class HomeBlocPage extends StatelessWidget {
  final String title;
  HomeBlocPage({Key? key, required this.title}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(
          counterRepository: CounterRepository()
      )..add(CounterFetchEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: CounterBody(),
      ),
    );
  }
}