import "package:flutter/material.dart";
import "package:registration/activity.dart";
import "package:registration/register_patient/model/patient.dart";
import 'package:registration/scaffold.dart';
import "package:registration/test_bench.dart";
import "package:uuid/uuid.dart";

final List<Patient> kAllPatients = [
  Patient(
    id: Uuid().v4().toString(),
    opdNumber: "10-1002",
    name: "John Doe",
    location: "Guesthouse",
    lastVisit: DateTime.now(),
  ),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
  Patient(id: Uuid().v4().toString(), opdNumber: "10-2001", name: "Jane Doe", location: "Academy", lastVisit: DateTime.now()),
];

class RegisterPatientPage extends StatefulWidget {
  @override
  _RegisterPatientPageState createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  List<Patient> matchingPatients = [];

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
        title: "Register patient",
        body: SizedBox(
          height: 400,
          child: Column(
            children: [
              buildActionRow(),
              Row(
                children: [
                  Expanded(
                    child: buildPatientTable(),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add new patient',
          child: const Icon(Icons.add),
        ));
  }

  Widget buildPatientTable() {
    if (matchingPatients.isEmpty) {
      return Container();
    }

    var c = Container();

    return Scrollbar(
      isAlwaysShown: true,
      thickness: 8,
      controller: scrollController,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text("OPD No."),
              ),
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text("Location"),
              ),
              DataColumn(
                label: Text("Last visit"),
              ),
            ],
            rows: buildTableRows(),
          ),
        ),
      ),
    );
  }

  List<DataRow> buildTableRows() {
    return matchingPatients
        .map((e) => DataRow(
              cells: [
                DataCell(Text(e.opdNumber)),
                DataCell(Text(e.name)),
                DataCell(Text(e.location)),
                DataCell(Text(e.lastVisit.toString())),
              ],
            ))
        .toList();
  }

  Row buildActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Search patient...",
                suffixIcon: Container(
                  child: Icon(Icons.search),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  var normalizedValue = value.trim().toLowerCase();
                  if (normalizedValue.isEmpty) {
                    matchingPatients = [];
                  } else {
                    matchingPatients =
                        kAllPatients.where((patient) => patient.name.toLowerCase().contains(normalizedValue)).toList();
                  }
                });
              },
            ),
          ),
        )
      ],
    );
  }
}

void main() {
  runApp(
    TestBench(
      child: RegisterPatientPage(),
      isFullPage: true,
    ),
  );
}
