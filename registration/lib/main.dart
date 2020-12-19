import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:registration/ui/dashboard/dashboard.dart';

GetIt getIt = GetIt.instance;

void main() {
  runApp(
    MaterialApp(
      title: "Registration",
      home: RegistrationDashboard(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
