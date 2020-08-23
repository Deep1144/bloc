import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementInitial(0,10));

  @override
  Stream<IncrementState> mapEventToState(
    IncrementEvent event,
  ) async* {
    if(event is Increment)
      yield IncrementCount.fromOldState(state ,inc: state.count + 1);
    else
      yield DecrementCount.fromOldState(state , dec:state.dec - 1);
  }
}
