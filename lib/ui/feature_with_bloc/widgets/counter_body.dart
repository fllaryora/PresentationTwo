
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_bloc.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_event.dart';
import 'package:presentationtwo/ui/feature_with_bloc/model/counter_model.dart';
import 'package:presentationtwo/ui/feature_with_bloc/bloc/counter_state.dart';

class CounterBody extends StatefulWidget {

  @override
  _CounterBodyState createState() => _CounterBodyState();
}

class _CounterBodyState extends State<CounterBody> {

  //final List<CounterModel> _counterList = [];
  Counter _counter = Counter();

  //for lists with scroll
  //final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Center(
        child: BlocConsumer<CounterBloc, CounterState> (
          listener: (context, counterState) {
            if(counterState is CounterLoadingState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(counterState.message)));
            }
            else if(counterState is CounterErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(counterState.errorMessage)));
              BlocProvider.of<CounterBloc>(context).isFetching = false;
            }
            /* check empty case for list use imagination*/
            else if(counterState is CounterSuccessState && counterState.payload.countable.isEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Empty case!")));
            }
          }, //end of listener

          builder: (context, counterState) {

            if( counterState is CounterLoadingState  && _counter.countable.isEmpty ||
                counterState is CounterInitialState ) {
              return CircularProgressIndicator();
            } // loading case

            else if(counterState is CounterSuccessState ) {
              _counter = counterState.payload;
              //for list do
              //_counterList.addAll(counterState.payload);
              BlocProvider.of<CounterBloc>(context).isFetching = false;
            } // end of success case

            else if(counterState is CounterErrorState && _counter.countable.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (){
                        BlocProvider.of<CounterBloc>(context)
                            ..isFetching = true
                            ..add(CounterFetchEvent());
                      },
                      icon: Icon(Icons.refresh)
                  ),
                  const SizedBox(height: 15,),
                  Text(counterState.errorMessage, textAlign: TextAlign.center,),
                ],
              );
            }//end of  error case

            //For all the rest and the success case
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      BlocProvider.of<CounterBloc>(context)
                        ..isFetching = true
                        ..add(CounterFetchEvent());
                    },
                    icon: Icon(Icons.refresh)
                ),
                const SizedBox(height: 15,),
                Text(_counter.countable, textAlign: TextAlign.center,),
              ],
            );
            //For list cases

/*            return  ListView.separated(
              itemCount: _counterList.length,
              separatorBuilder: (contex, index) => SizedBox(height: 20,),
              itemBuilder: (contex, index) => CounterItemWidget(XXXX),
              controller: _scrollController..addListener(() {
                //when I scroll to the end
                if(_scrollController.offset == _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<CounterBloc>(context).isFetching ) {
                  BlocProvider.of<CounterBloc>(context)
                      ..isFetching = true
                      ..add(CounterFetchEvent());

                }
              }),
            );*/

          }, // end of the builder
        ),
      );
  }

  /*
   //For list cases
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }*/

}