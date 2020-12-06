import 'package:flutter/material.dart';
import 'package:registration/register_patient/widgets/register_patient_dialog.dart';
import 'package:registration/test_bench.dart';

void main() {
  runApp(
    TestBench(
      child: RegisterPatientDialog(),
      isFullPage: true,
    ),
  );
}