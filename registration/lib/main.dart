import "package:flutter/material.dart";
import 'package:registration/ui/dashboard/dashboard.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Registration",
      home: RegistrationDashboard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
