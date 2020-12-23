import "package:flutter/material.dart";
import 'package:registration/locator.dart';
import 'package:registration/ui/dashboard/dashboard.dart';

void main() {
  createMockContext();

  runApp(
    MaterialApp(
      title: "Registration",
      home: RegistrationDashboard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
