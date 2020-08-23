import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/employee.dart';

part 'emp_event.dart';
part 'emp_state.dart';


class EmpBloc extends Bloc<EmpEvent, EmpState> {
  EmpBloc() : super(EmpInitial(new Employee("Deep", "18")));

  @override
  Stream<EmpState> mapEventToState(
    EmpEvent event,
  ) async* {
    if(event is ChangeEmployee){
      yield ChangeEmployeeState(Employee("Ravi","19"));
    }
  }
}
