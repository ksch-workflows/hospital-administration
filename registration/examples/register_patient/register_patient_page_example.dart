import 'package:flutter/material.dart';
import 'package:registration/register_patient/register_patient_page.dart';
import 'package:registration/test_bench.dart';

void main() {
  runApp(
    TestBench(
      child: RegisterPatientPage(),
      isFullPage: true,
    ),
  );
}