part of 'emp_bloc.dart';

abstract class EmpEvent extends Equatable {
  const EmpEvent();

  @override
  List<Object> get props => [];
}


class ChangeEmployee extends EmpEvent{
  
}