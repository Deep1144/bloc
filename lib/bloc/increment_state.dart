part of 'increment_bloc.dart';

abstract class IncrementState extends Equatable {
  final int dec;
  final int count ;
  
  const IncrementState({this.count,this.dec}):super();
  
  @override
  List<Object> get props => [count,dec];
}

class IncrementInitial extends IncrementState {
  IncrementInitial(int count,int dec) : super(count : count , dec : dec);
}

class IncrementCount extends IncrementState{
  IncrementCount(int count):super(count:count);

  IncrementCount.fromOldState(
    oldstate,
    {inc ,dec}
  ) :super(
    count : inc ?? oldstate.count,
    dec :oldstate.dec
  );
} 

class DecrementCount extends IncrementState{
  DecrementCount(int count):super(dec:count); 

  DecrementCount.fromOldState(
    oldstate,
    {dec}
  ) :super(
    count :oldstate.count,
    dec :dec ?? oldstate.dec
  );
}

//trying sublime git