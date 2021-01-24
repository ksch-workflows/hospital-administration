import "package:flutter/material.dart";
import "package:registration/util/test_bench.dart";
import "package:registration/ui/register_patient/register_patient_dialog/visit_type.dart";
import "package:registration/util/form_stepper.dart";

void main() {
  var contactInformationStep = VisitTypeFormStep(visitTypeSelection: FormValue<String>());

  runApp(
    TestBench(
      child: contactInformationStep.body,
    ),
  );
}
