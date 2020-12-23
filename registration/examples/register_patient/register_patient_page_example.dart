import 'package:flutter/material.dart';
import 'package:registration/locator.dart';
import 'package:registration/util/test_bench.dart';
import 'package:registration/ui/register_patient/register_patient_page.dart';

void main() {
  createMockContext();

  runApp(
    TestBench(
      child: RegisterPatientPage(),
      isFullPage: true,
    ),
  );
}
