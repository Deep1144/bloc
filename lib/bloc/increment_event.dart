part of 'increment_bloc.dart';

abstract class IncrementEvent extends Equatable {
  const IncrementEvent();

  @override
  List<Object> get props => [];
}

class Increment extends IncrementEvent {
  Increment():super();
}

class Decrement extends IncrementEvent{
  Decrement():super();
}
