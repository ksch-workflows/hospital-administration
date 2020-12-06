
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepperCubit extends Cubit<StepperState> {
  final int numberOfSteps;

  StepperCubit(this.numberOfSteps) : super(FirstStep());

  void back() {
    final currentIndex = state.index;
    if (currentIndex == 0) {
      return;
    }
    final newIndex = currentIndex - 1;
    if (newIndex == 0) {
      emit(FirstStep());
    } else {
      emit(IntermediateStep(newIndex));
    }
  }

  void next() {
    final currentIndex = state.index;
    if (currentIndex == numberOfSteps - 1) {
      emit(Finished());
      return;
    }
    final newIndex = currentIndex + 1;
    if (newIndex == numberOfSteps - 1) {
      emit(LastStep(newIndex));
    } else {
      emit(IntermediateStep(newIndex));
    }
  }
}

@immutable
abstract class StepperState extends Equatable {
  int get index;

  @override
  List<Object> get props => [index];
}

class FirstStep extends StepperState {
  int get index => 0;
}

class IntermediateStep extends StepperState {
  final int _index;

  IntermediateStep(this._index);

  int get index => _index;
}

class LastStep extends StepperState {
  final int _index;

  LastStep(this._index);

  int get index => _index;
}

class Finished extends StepperState {
  int get index => -1;
}