import 'package:flutter/material.dart';
import 'package:registration/dashboard.dart';
import 'package:registration/scaffold.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Registration',
      home: Material(
        child: WorkflowScaffold(
          body: RegistrationDashboard(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
