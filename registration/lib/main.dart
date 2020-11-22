import "package:flutter/material.dart";
import "package:registration/dashboard.dart";

void main() {
  runApp(
    MaterialApp(
      title: "Registration",
      home: RegistrationDashboard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
