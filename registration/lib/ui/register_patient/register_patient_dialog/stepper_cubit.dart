
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/ui/register_patient/register_patient_dialog/form_stepper.dart';



class FormStep {
  final FormStepWidget widget;
  final FormStepModel model;
  
  FormStep(this.widget, this.model);
}

abstract class FormStepModel {
  bool validate();
}

class StepperCubit extends Cubit<StepperState> {
  final List<FormStep> steps;

  StepperCubit(this.steps) : super(FirstStep(formStep: steps[0]));

  void back() {
    if (!state.validate()) {
      return;
    }
    final currentIndex = state.index;
    if (currentIndex == 0) {
      return;
    }
    final newIndex = currentIndex - 1;
    if (newIndex == 0) {
      emit(FirstStep(formStep: steps[0]));
    } else {
      emit(IntermediateStep(formStep: steps[newIndex], index: newIndex));
    }
  }

  void next() {
    if (!state.validate()) {
      return;
    }
    final currentIndex = state.index;
    if (currentIndex == steps.length - 1) {
      emit(Finished());
      return;
    }
    final newIndex = currentIndex + 1;
    if (newIndex == steps.length - 1) {
      emit(LastStep(formStep: steps[newIndex], index: newIndex));
    } else {
      emit(IntermediateStep(formStep: steps[newIndex], index: newIndex));
    }
  }
}

@immutable
abstract class StepperState extends Equatable {
  int get index;
  FormStep get formStep;

  @override
  List<Object> get props => [index];

  bool validate() => formStep.model.validate();
}

class FirstStep extends StepperState {
  final FormStep formStep;

  FirstStep({@required this.formStep});

  int get index => 0;
}

class IntermediateStep extends StepperState {
  final int index;
  final FormStep formStep;

  IntermediateStep({@required this.formStep, @required this.index});
}

class LastStep extends StepperState {
  final int index;
  final FormStep formStep;

  LastStep({@required this.formStep, @required this.index});
}

class Finished extends StepperState {
  int get index => -1;
  FormStep get formStep => null;
}
