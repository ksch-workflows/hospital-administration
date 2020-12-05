import "package:flutter/material.dart";
import "package:registration/test_bench.dart";

/// References:
/// - https://developer.school/flutter-how-to-use-the-stepper-widget/
/// - https://www.youtube.com/watch?v=Rr-5s_B2Ygo
/// - https://stackoverflow.com/questions/57003364/how-to-disable-in-flutter-stepper-the-first-cancel-button
/// - https://stackoverflow.com/questions/56785089/custom-buttons-design-for-stepper
class PatientRegistrationStepper extends StatefulWidget {
  @override
  _PatientRegistrationStepperState createState() => _PatientRegistrationStepperState();
}

class _PatientRegistrationStepperState extends State<PatientRegistrationStepper> {
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stepper(
          steps: _steps,
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepContinue: next,
          onStepTapped: (step) => goTo(step),
          onStepCancel: cancel,
          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    RaisedButton(
                      child: Text("Cancel"),
                      onPressed: () => print("TODO: Cancel"),
                    ),
                    RaisedButton(
                      child: Text("Back"),
                      onPressed: onStepCancel,
                    ),
                    RaisedButton(
                      child: Text("Continue"),
                      onPressed: onStepContinue,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }
    );
  }

  next() {
    currentStep + 1 != _steps.length ? goTo(currentStep + 1) : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }
}

List<Step> _steps = [
  Step(
    title: const Text("Personal details"),
    isActive: true,
    state: StepState.complete,
    content: Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Name"),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Father's name"),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Date of birth"),
        ),
      ],
    ),
  ),
  Step(
    title: const Text("Contact information"),
    isActive: true,
    state: StepState.complete,
    content: Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Location"),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Phone number"),
        ),
      ],
    ),
  ),
  Step(
    title: const Text("Visit type"),
    isActive: true,
    state: StepState.complete,
    content: Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Visit type"),
        ),
      ],
    ),
  ),
];

void main() {
  runApp(
    TestBench(
      child: PatientRegistrationStepper(),
    ),
  );
}
