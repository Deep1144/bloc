import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter_app/main2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterPage(),
    );
    
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "bloc",
          ),
        ),
        body: BlocBuilder<CounterBloc, int>(
          builder: (BuildContext context, int state) {
            return Center(
              child: FlatButton(
                onPressed: () {
                  context.bloc<CounterBloc>().add(CounterEvent.increment);
                },
                child: Text(
                  '$state Inc',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
      default:
        addError("unsuppoted event");
    }
    // throw UnimplementedError();
  }
}

enum CounterEvent { increment, decrement }




