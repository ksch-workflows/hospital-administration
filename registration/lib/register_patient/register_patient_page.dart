import "package:flutter/material.dart";
import 'package:registration/dashboard.dart';
import "package:registration/register_patient/model/patient.dart";
import 'package:registration/routing.dart';
import 'package:registration/scaffold.dart';
import "package:registration/test_bench.dart";

class RegisterPatientPage extends StatefulWidget {
  @override
  _RegisterPatientPageState createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  List<Patient> matchingPatients;

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      title: "Register patient",
      body: Column(
        children: [
          _buildActionRow(),
          SizedBox(height: 25),
          Flexible(child: Row(
            children: [
              Expanded(child: Container(child: _buildPatientTable())),
            ],
          ),),
        ],
      ),
      onNavigateBack: () {
        Navigator.push(context, WebPageRoute(builder: (context) => RegistrationDashboard()));
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add new patient",
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPatientTable() {
    if (matchingPatients == null) {
      return Container();
    }
    if (matchingPatients.isEmpty) {
      return Text("No patients found.");
    }

    return Scrollbar(
      isAlwaysShown: matchingPatients.length > 7,
      thickness: 8,
      controller: scrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        child: DataTable(
          columns: <DataColumn>[
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
          rows: _buildTableRows(),
        ),
      ),
    );
  }

  List<DataRow> _buildTableRows() {
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

  Row _buildActionRow() {
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
                    matchingPatients = null;
                  } else {
                    matchingPatients =
                        kAllPatients.where((patient) => patient.name.toLowerCase().contains(normalizedValue)).toList();
                  }
                });
              },
              autofocus: true,
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
      isFullPage: false,
    ),
  );
}
