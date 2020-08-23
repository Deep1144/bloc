part of 'emp_bloc.dart';

abstract class EmpState extends Equatable {

  final Employee emp;

  const EmpState(this.emp);
  
  @override
  List<Object> get props => [emp];
}

class EmpInitial extends EmpState {
  EmpInitial(Employee emp) : super(emp);
}

class ChangeEmployeeState extends EmpState{
  ChangeEmployeeState(Employee emp) : super(emp);
}
