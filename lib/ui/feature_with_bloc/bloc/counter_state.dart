
import 'package:presentationtwo/ui/feature_with_bloc/model/counter_model.dart';

abstract class CounterState {
  const CounterState();
}

class CounterInitialState extends CounterState {
  const CounterInitialState();
}


class CounterLoadingState extends CounterState {
  final String message;
  const CounterLoadingState({
    required this.message
});
}

class CounterSuccessState extends CounterState {
  final Counter payload;
  const CounterSuccessState({
    required this.payload
  });
}

class CounterErrorState extends CounterState {
  final String errorMessage;
  const CounterErrorState({
    required this.errorMessage
  });
}
