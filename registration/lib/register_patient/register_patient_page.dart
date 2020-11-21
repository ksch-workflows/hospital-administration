import 'package:flutter/material.dart';
import 'package:registration/activity.dart';
import 'package:registration/register_patient/model/patient.dart';
import 'package:registration/test_bench.dart';
import 'package:uuid/uuid.dart';

class RegisterPatientPage extends StatefulWidget {
  @override
  _RegisterPatientPageState createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final List<Patient> patients = [
    Patient(id: Uuid().v4().toString(), name: "John Doe", location: "Guesthouse", lastVisit: DateTime.now()),
    Patient(id: Uuid().v4().toString(), name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Activity(
      title: "Register patient",
      onNavigateBack: () {},
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child: const Text("New patient"),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text("Search patient"),
              ),
            ],
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    TestBench(
      child: RegisterPatientPage(),
    ),
  );
}
