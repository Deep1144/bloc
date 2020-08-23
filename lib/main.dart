import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bloc/emp_bloc.dart';
import 'package:flutter_app/bloc/increment_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IncrementBloc(),
      child: CountPage(),
    );
  }
}

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BlocInc",
      home: Scaffold(
        appBar: AppBar(
          title: Text("BLocInc"),
        ),
        body: BlocBuilder<IncrementBloc, IncrementState>(
          builder: (context, state) {
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        context.bloc<IncrementBloc>().add(Increment());
                      },
                      child: Text(
                        "${state.count} Inc",
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        context.bloc<IncrementBloc>().add(Decrement());
                      },
                      child: Text(
                        "${state.dec} dec",
                      ),
                    ),



                    BlocProvider(
                      create: (_) => EmpBloc(),
                      child: Card(
                        child: BlocBuilder<EmpBloc, EmpState>(
                          builder: (context, state) {
                            return Column(
                              children: <Widget>[
                                Text(
                                  "${state.emp.name} ${state.emp.age}",
                                ),
                                FlatButton(onPressed: (){
                                  context.bloc<EmpBloc>().add(ChangeEmployee());
                                }, child: Text("Change"))
                              ],
                            );
                          },
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
