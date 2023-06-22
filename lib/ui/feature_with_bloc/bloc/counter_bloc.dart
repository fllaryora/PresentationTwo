import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_event.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_state.dart';
import 'package:presentationtwo/ui/feature_with_bloc/model/counter_model.dart';
import 'package:presentationtwo/ui/feature_with_bloc/repository/counter_repository.dart';
import 'package:http/http.dart' as http;

//this way no need strem controller with disposes
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;

  bool isFetching = false;
  int page = 1;
  CounterBloc({required this.counterRepository}) : super(CounterInitialState());

  //in the version 8.0.0 it process is different
  @override
  Stream <CounterState> mapEventToState(CounterEvent  event) async* {

    if(event is CounterFetchEvent) {
      yield CounterLoadingState(message: "Loading Counter");
      // this is a dynamic
      final response = await counterRepository.getCounter(page);
      if(response is http.Response) {
        // 200 ?
        if(response.statusCode == HttpStatus.ok) {
          final counterPayload = jsonDecode(response.body);
          yield CounterSuccessState(payload: Counter.fromJson(counterPayload));

          //if the response is a json List do
          //final counterPayload = jsonDecode(response.body) as List;
          //final counterS = counterPayloadL.map((item) => Counter.fromJson(item)).toList();
          //yield CounterSuccessState(payloadList: counterS);

          page++;
          //I love coroutines !!!
        } else {
          yield CounterErrorState(errorMessage: "Error fetching ${response.body}");
        }

      } else if (response is String) { // response isn't http.Response
        yield CounterErrorState(errorMessage: "Error fetching $response");
      }

    }
    //add the other events handlers here
  }

}