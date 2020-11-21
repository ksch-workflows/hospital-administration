import "package:flutter/material.dart";
import "package:registration/activity.dart";
import "package:registration/register_patient/model/patient.dart";
import "package:registration/test_bench.dart";
import "package:uuid/uuid.dart";

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
    );
  }

  DataTable buildPatientTable() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            "No.",
          ),
        ),
        DataColumn(
          label: Text(
            "Name",
          ),
        ),
        DataColumn(
          label: Text(
            "Location",
          ),
        ),
        DataColumn(
          label: Text(
            "Last visit",
          ),
        ),        
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text("Sarah")),
            DataCell(Text("19")),
            DataCell(Text("Student")),
            DataCell(Text(DateTime.now().toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text("Janine")),
            DataCell(Text("43")),
            DataCell(Text("Professor")),
            DataCell(Text(DateTime.now().toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text("William")),
            DataCell(Text("27")),
            DataCell(Text("Associate Professor")),
            DataCell(Text(DateTime.now().toString())),
          ],
        ),
      ],
    );
  }

  Row buildActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RaisedButton(
          child: const Text("New patient"),
          onPressed: () {},
        ),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Search patient...",
              suffixIcon: Container(
                child: Icon(Icons.search),
              ),
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
    ),
  );
}
