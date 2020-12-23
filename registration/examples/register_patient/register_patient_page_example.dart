import 'package:flutter/material.dart';
import 'package:registration/util/test_bench.dart';
import 'package:registration/ui/register_patient/register_patient_page.dart';

void main() {
  runApp(
    TestBench(
      child: RegisterPatientPage(),
      isFullPage: true,
    ),
  );
}